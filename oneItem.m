function [responseC, t, tbox] =  oneItem(ques, i, w, wsize, kb, mode, conf, sign)
scalemap = ['1: ' ques.scales{i, 1}];
for j=2:size(ques.scales, 2)
  scalemap = [scalemap, '  ', num2str(j) ': ', ques.scales{i, j}];
end

% either use instr or target for each item
if mode.constantInstr_on % show isntr every screen
  DrawFormattedText(w, [ques.instr{i} '\n\n' sign.lang.rule_i], 0, 30, [255, 255, 255, 255], conf.wrapat, 0, 0, conf.vspacing);
else
  DrawFormattedText(w, ques.target{i}, 'center', wsize(4)/2-100, 255, conf.wrapat, 0, 0, conf.vspacing);
end

% kbCode = Instruction(ques.items{i}, w, wsize, 0, 1, kb, 5 ,1, 0);
[nx ny tbox] = DrawFormattedText(w, [ques.items{i} '\n\n\n' scalemap], 'center', 'center', [255 255 255], conf.wrapat, 0, 0, conf.vspacing);

tbox.nx = nx;
tbox.ny = ny;
tbox.tbox = tbox;

Screen('Flip',w);

preT = GetSecs;
[kbCode, postT] = pedalWait(0, inf,kb);
% [t, kbCode] = KbWait([],2);

kbName = KbName(kbCode);
responseC = kbName(1);
t = postT - preT;
end