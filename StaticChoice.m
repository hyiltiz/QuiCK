function [ques ] = StaticChoice(questionaire, mode, conf)

%% input check and setting default values
if nargin > 1
  render.conf=conf;
  render.mode=mode;
end

conf.instrWait = 2;
conf.byetime = 3;
conf.wrapat = 72;
conf.vspacing = 1.5;

mode.debug_on = 0;
mode.english_on = 0;
mode.recordImage = 0;
mode.constantInstr_on = 1;

if nargin > 1
  conf = updateStruct(render.conf, conf);
  mode = updateStruct(render.mode, mode);
end

% default i18n strings
sign.en.bye  = ['Thanks for your participation, goodbye!'];
sign.en.pass = ['Passed! Please continue to the next experiment.'];
sign.en.press= ['Press any key to continue'];
sign.en.miss = ['Some answers to the following questions cannot be identified. \nAnswer again according to the requirements.'];
sign.en.rule = ['Please use keys 1 to %s to response. And do NOT press any other key.'];
sign.zh.bye  = ['感谢您的参与，再见！'];
sign.zh.pass = ['测试通过！请进入下一个实验。'];
sign.zh.press= ['请按任意键以继续'];
sign.zh.miss = ['以下问题的答案不符合要求。请根据要求重新填写'];
sign.zh.rule = ['请用键盘上数字 1 到 %s 作出反应（请不要按其它键）。'];


ques = quesDB(questionaire);


if isfield(ques, 'lang') && strcmp(ques.lang, 'en')
  mode.english_on = 1;
end

if mode.english_on
  sign.lang = sign.en;
else
  sign.lang = sign.zh;
end

try
  kb = keyDefinition();
  screens=Screen('Screens');
  screenNumber=max(screens);
  
  if mode.debug_on
    [w,wsize]=Screen('OpenWindow',screenNumber,0,[ 1,1,801,601],[]);
  else
    [w,wsize]=Screen('OpenWindow',screenNumber,0);
  end
  ListenChar(2);
  InitializeMatlabOpenGL;
  Screen('Preference', 'TextRenderer', 2);
  %     Screen('Preference','TextEncodingLocale','UTF-8');
  Screen('Preference', 'TextAntiAliasing', 1);
  %       Screen('TextSize',w, 14);
  % text style:
  %0=normal,1=bold,2=italic,4=underline,8=outline,32=condense,64=extend.
  Screen('TextStyle', w, 0);
  
  % try to set a decent font
  fprintf('New window opened with font set to %s.\n', Screen('TextFont', w));
  for font = {'Arial', 'Geneva', 'Helvetica', 'sans-serif'}
    % Set font
    Screen('TextFont', w, char(font));     % Win: currently needs the call to "char"
    
    % Check if the screen's font has changed to the one we requested.
    match = streq(font, Screen('TextFont', w));
    if match
      fprintf('Successfully set font to %s.\n', Screen('TextFont', w));
      break;
    end
  end
  if ~match
    error('We couldn''t find any of the fonts we wanted.');
    fprintf('The window font is %s.\n', Screen('TextFont', w));
  end
  
  
  % initialize the response array
  responseC=cell(numel(ques.items),1);
  restime=zeros(numel(ques.items),1);
  box = struct();
  for i = 1:length(ques.items)
    %         whichtitle = find(cell2mat(ques.title(:,1))==i>0, 1);
    %         if ~mode.constantInstr_on && sum(cell2mat(ques.title(:,1))==i>0)
    if sum(cell2mat(ques.title(:,1))==i>0)
      % show instruction as a title for one session if needed
      
      
      % in some questionaires, the available choice for each item varies;
      % therefore the numbering and points should also be changed for them.
      % those empty cell parts are not present for items with less choices.
      sign.lang.rule_i = sprintf(sign.lang.rule, num2str(sum(~cellfun('isempty', ques.scales(i,:)))));
      DrawFormattedText(w, [ques.title{find(cell2mat(ques.title(:,1))==i>0, 1),2} '\n\n' sign.lang.rule_i], 'center', 'center', 255, conf.wrapat, 0, 0, conf.vspacing);
      Screen('Flip', w);
      if mode.recordImage; recordImage(1,1,[questionaire '_instr'] ,w,wsize);end
      WaitSecs(conf.instrWait);
      DrawFormattedText(w, [ques.title{find(cell2mat(ques.title(:,1))==i>0, 1),2} '\n\n' sign.lang.rule_i '\n\n' sign.lang.press], 'center', 'center', 255, conf.wrapat, 0, 0, conf.vspacing);
      Screen('Flip', w);
      if mode.recordImage; recordImage(1,1,[questionaire '_instr'] ,w,wsize);end
      pedalWait(0, inf, kb);
    end
    
    % here we callect each item idx with i; helper function
    [responseC{i}, restime(i), tbox(i)] =  oneItem(ques, i, w, wsize, kb, mode, conf, sign);
    if mode.recordImage; recordImage(1,1,[questionaire],w,wsize);end
  end
  
  % any missing values present?
  % TODO: not necessarily use numbers for keypress, since they have order
  % and value; some scales would want to use letters only instead.
  ques.response = responseC;
  ques.restime  = restime;
  
  responseM = str2double(responseC);
  
  % TODO: this checkting should be adjusted to a item-wise basis, since
  % some questionaires have varied choice selection for different itesms.
  %   isMissing = ~ismember(responseM, 1:size(ques.scales,2));
  isMissing = isnan(sum(~cellfun('isempty', ques.scales), 2) - responseM);
  if sum(isMissing)
    % tell them to be a good kid
    sign.lang.rule_i = sprintf(sign.lang.rule, num2str(sum(~cellfun('isempty', ques.scales(find(isMissing, 1),:)))));
    DrawFormattedText(w, [sign.lang.miss  '\n\n' sign.lang.rule_i], 'center', 'center', [255 0 0], conf.wrapat, 0, 0, conf.vspacing);
    WaitSecs(conf.byetime);
    Screen('Flip', w);
    pedalWait(0, inf, kb);
  end
  while sum(isMissing) % we [still] have missing values
    responseM(isMissing) = NaN;
    
    % collect back those missing ones
    idxMissing = find(isMissing);
    for i=idxMissing'
      [responseC{i}, restime(i)] =  oneItem(ques, i, w, wsize, kb, mode, conf, sign);
    end
    responseM = str2double(responseC);
    isMissing = ~ismember(responseM, 1:size(ques.scales,2));
  end
  
  % convect and calculate output according to response chars and ques.encode
  % result is ques.encdoe.scale{:,3} and responseM
    save the_result;
  [ques, responseM] = quesEncode(ques, responseC);
  
  
  resultS = '';
  for i=1:size(ques.encode.scale,1)
    resultS = [resultS, ques.encode.scale{i,1} ': ', num2str(ques.encode.scale{i,3}) '  '];
  end
  Display(resultS);
  
  if ques.isShowResult
    Instruction(resultS, w, wsize, 0, 1, kb, 5 ,1, 0);
    WaitSecs(5);
  end
  
  
  if isempty(ques.thrsh)
    % do nothing, just record
  else
    ques.isOK = ~xor(ques.thrsh{3}, (ques.thrsh{2}(1) <= sum(ques.encode.scale{ques.thrsh{1},3}) & sum(ques.encode.scale{ques.thrsh{1},3}) <= ques.thrsh{2}(2)));
    if ques.isOK
      % we wanted results to be inside [a,b] and now they are
      %             Screen('DrawText', w, ['Passed! Please continue to the next experiment.'], 0, 190, [0, 50, 0, 255]);
      DrawFormattedText(w, sign.lang.pass, 'center', 'center', [0, 255, 0, 255]);
    else
      %             Screen('DrawText', w, ['Thanks for your participation!'], 0, 190, [255, 255, 255, 255]);
      DrawFormattedText(w, sign.lang.bye, 'center', 'center', [255, 255, 255, 255]);
    end
    Screen('Flip',w);
    WaitSecs(conf.byetime);
    KbWait;
  end
  
catch
  Screen('CloseAll');
  Priority(0);
  ShowCursor;
  ListenChar(0);
  psychrethrow(psychlasterror);
  sca
end
sca
ListenChar(0);

boxplot(ques.restime);
end
