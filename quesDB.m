function ques = quesDB(nameS)
% questionaire db

switch nameS
    case 'IRI'
        ques.items = {'��ʱ���������Σ�������ܻᷢ���������ϵ����顣', '������Щû�������˵��ˣ��Ҿ����ỳ������������֮�顣', '��ʱ���Ҿ��ú��Ѵ����˵ĽǶȿ����⡣', '��������������ʱ����ʱ�Ҳ������ͬ�����ǡ�', '��ȷʵ������С˵���������С�', '�ڽ���״���£��һ�е����ĺͲ�����', '���͵�Ӱ��Ϸ��ʱ����������ܿ͹ۣ���������ȫ�������С�', '��������֮ǰ���һ�ȥ�ο���ҵĲ�ͬ�����', '�������˱�����ʱ���Ҿ��б������ǵ��뷨��', '�����߶����������龳��ʱ������ʱ��е�������', '��ʱ�һ��������Ѷ�����Ŀ������Ӷ����õ�������ǡ�', '�Һ��ٻ���ȫ������һ�������һ���õ�Ӱ�С�', '�����������˺�ʱ���������ᱣ��ƽ����', '���˵Ĳ���ͨ���������Һܲ�����', '����ҿ϶��Լ��ǶԵģ��ҾͲ����˷����ʱ��ȥ�����˵������', '����Ϸ����Ӱ���Ҹо��Լ�����������е�һ����ɫ��', '�����ŵ��龳�У��һ�е��־塣', '�����������ܵ�����ƽ�Դ�ʱ����ʱ�Ҳ����ͬ�����ǡ�', '�Ҿ��������Ч�ش�������¼���', '�Ҿ���������������������ж���', '����Ϊ�κ����ⶼ�������ԣ����������������������������⡣', '����Ϊ�Լ��Ǹ��ǳ�������ˡ�', '�ۿ�һ�����ʵĵ�Ӱʱ���Һ����װ��Լ����������������ǡ�', '���������ڽ�������²�֪���롣', '�����������ķ�ʱ���ҳ��������ص�Ϊ����һ�¡�', '�ڶ���Ȥ�Ĺ��»�С˵ʱ���һ�����������������ڷ����������ϣ�\n\n�һ���ʲô���ĸ��ܡ�', '���������ڽ�������¼������ʱ���һ�����������', '����������֮ǰ���һ���������Լ��������ǵ����������������ĸ��ܡ�'};
        ques.title = {1, '����˵�������ã��������й����ڲ�ͬ�龳�¿��ܻ��е��뷨�͸��ܡ�\n\n��ÿһ��Ŀ����ѡ�������������ϵ�ѡ�������Ӧ�����ּ�����ѡ��'}; % display title before 1st item, only for once (this time)
        ques.target = repmat({''}, numel(ques.items),1); % to be used along with title, so for each item, a specific keyword as question can be specified
        ques.instr = repmat({'����˵�������ã��������й����ڲ�ͬ�龳�¿��ܻ��е��뷨�͸��ܡ�\n\n��ÿһ��Ŀ����ѡ�������������ϵ�ѡ�������Ӧ�����ּ�����ѡ��'}, numel(ques.items),1);
        ques.scales = repmat({'��ȫ������','����������', '��ȷ��', '��������', '��ȫ����'}, numel(ques.items),1);
        ques.encode.scale = {'PT', [3, 8, 11, 15, 21, 25, 28]; 'FS', [1, 5, 7, 12, 16, 23, 26]; 'EC', [2, 4, 9, 14, 18, 20, 22]; 'PD', [6, 10, 13, 17, 19, 24, 27]};
        %����Ƿ��⣺
        ques.encode.inv = [3, 4, 7, 12, 13, 14, 15, 18, 19];
        ques.thrsh = {1, [-inf, inf], 0}; % for ques.encode.scale, {idx, [a b], isInGood}; or [] if no thrreshold required
        ques.isShowResult = 0; % whether show result for the participant
        % %�ʾ�˵�������ʾ��4��ά�ȣ�����Խ�ߣ�˵����������Խ�ߡ�
        % %�۵����perspective-taking��
        % PT = [3, 8, 11, 15, 21, 25, 28];
        % %���루fantasy,
        % FS = [1, 5, 7, 12, 16, 23, 26];
        % %�����ע��empathic concern,
        % EC = [2, 4, 9, 14, 18, 20, 22];
        % %���˱��ˣ�personal distress,
        % PD = [6, 10, 13, 17, 19, 24, 27];
        
    case 'STAI'
        ques.items = {'�Ҹе�����ƽ��', '�Ҹе���ȫ', '���ǽ��ŵ�', '�Ҹе���������', '�Ҹе�����', '�Ҹе�����', '�����������գ��е����ַ��ճ����˿��ܵĲ���', '�Ҹе�����', '�Ҹе�����', '�Ҹе�����', '����������', '�Ҿ����񾭹���', '�Ҽ��Ƚ��Ų���', '������Ѷ�', '�������ɵ�', '�Ҹе���������', '���Ƿ��յ�', '�Ҹе�����', '�Ҹо���', '�Ҹе����','�Ҹе����', '�е��񾭹����Ͳ���', '�Ҹе���������', '��ϣ�����������������', '�Ҹе�����˥��һ��', '�Ҹе�������', '����ƽ���ġ��侲�ĺ�̩Ȼ������', '�Ҹе�����һһ�Ѽ�����������޷��˷�', '�ҹ�������һЩ�£�ʵ����Щ���޹ؽ�Ҫ', '���Ǹ��˵�', '�ҵ�˼�봦�ڻ���״̬', '��ȱ��������', '�Ҹе���ȫ', '��������������', '�Ҹе�������', '���������', 'һЩ����Ҫ��˼���ܲ������ң���������', '�Ҳ����ľ�ɥ�����ǿ�ң������Ҳ��ܴ�˼�����ų�����', '����һ���򶨵���', '���ҿ�����Ŀǰ�����������ʱ���Ҿ����˽���״̬'};
        ques.title = {1, '�����г��������ǳ����������������Լ��ĳ�����\n\n���Ķ�ÿһ��������Ȼ��ͨ���������ּ�����ʾ��������ǡ���ĸо���\n\nҲ�������ʱ�˿���ǡ���ĸо���û�жԻ��Ļش�\n\n��Ҫ���κ�һ��������̫���ʱ��ȥ���ǣ��������Ļش�Ӧ����\n\n��������ǡ���ĸо���'; 1+numel(ques.items)/2, '�����г��������ǳ����������������Լ��ĳ�����\n\n���Ķ�ÿһ��������Ȼ��ͨ���������ּ�����ʾ�㾭���ĸо���û�жԻ��Ļش�\n\n��Ҫ���κ�һ��������̫���ʱ��ȥ���ǣ����������ش�Ӧ������ƽ�����о����ġ�'}; % display title before 1st item, only for once (this time)
        ques.target = repmat({'��ʱ�˿�', 'ƽ��'}, numel(ques.items)/2,1); % to be used along with title, so for each item, a specific keyword as question can be specified
%         ques.target = repmat({''}, numel(ques.items),1);
        ques.instr = [repmat({'�����г��������ǳ����������������Լ��ĳ�����\n\n���Ķ�ÿһ��������Ȼ��ͨ���������ּ�����ʾ��������ǡ���ĸо���\n\nҲ�������ʱ�˿���ǡ���ĸо���û�жԻ��Ļش�\n\n��Ҫ���κ�һ��������̫���ʱ��ȥ���ǣ��������Ļش�Ӧ����\n\n��������ǡ���ĸо���'},numel(ques.items)/2,1); repmat({'�����г��������ǳ����������������Լ��ĳ�����\n\n���Ķ�ÿһ��������Ȼ��ͨ���������ּ�����ʾ�㾭���ĸо���û�жԻ��Ļش�\n\n��Ҫ���κ�һ��������̫���ʱ��ȥ���ǣ����������ش�Ӧ������ƽ�����о����ġ�'},numel(ques.items)/2,1)];
        ques.scales = [repmat({'��ȫû��','��Щ','�еȳ̶�','�ǳ�����'}, numel(ques.items)/2,1);repmat({'����û��','��Щ','����','�����������'}, numel(ques.items)/2,1)];
        ques.encode.scale = {'SAI', [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]; 'TAI', [21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40]};
        ques.encode.inv = [2,5,8,10,11,15,16,19,20,23,24,26,27,30,33,34,36,39];
        ques.thrsh = {1, [35, 45], 0}; % threshould for SAI, we do not want those between [35, 45];
        ques.isShowResult = 0;
        ques.target = ques.target(:);
        % ### STAI ״̬һ���ʽ����ʾ�
        %         ��ָ����Ͷ���������40����������ɡ���1-20��Ϊ״̬��������(STAI��Form Y-I�����¼��S-AD�����а���Ϊ����������������Ŀ������Ϊ����������Ŀ����Ҫ�����������̵Ļ����ĳһ�ض�ʱ����龰�Ŀ־塢���š����Ǻ����ʵ��������ܡ�����������Ӧ������µ�״̬���ǡ���21-40��Ϊ���ʽ�������STAI��Form Y-l�����T-AI)�������������Ǿ������������顣������11��Ϊ��������������Ŀ��9��Ϊ����������Ŀ��
        %
        % �������������ʾ����������������ұ�������ɡ������߸���ָ��������Ȧ���𰸡������ڸ��˻�����ԣ�������һ������г����Ļ�ˮƽ�������ʱ�����ƣ�һ��10-20���ӿ��������������Ŀ�Ļش�
        %
        % �Ʒַ���STAIÿһ�����1-4������S-AI��1һ��ȫû�У�2һ��Щ��3һ�еȳ̶ȣ�4һ�ǳ����ԡ�T-AI��1һ����û�У�2һ��Щ��3һ������4һ����������ˡ��������߸����Լ�������ѡȦ����ʵķ�ֵ��������������Ŀ��Ϊ����Ʒ֡��ֱ����S-AI��T-AI������ۼӷ֣���Сֵ20�����ֵΪ80����ӳ״̬�����ʽ��ǵĳ̶ȡ��±���ʾ����Ŀ�������SAI��TAI�������������������򣨸������ԡ�
        %
        %       SAI: [1, -2, 3, 4, -5, 6, 7, -8, 9, -10, -11, 12, 13, 14, -15, -16, 17, 18, -19, -20]
        %       TAI: [21, 22, -23, -24, 25, -26, -27, 28, 29, -30, 31, 32, -33, -34, 35, -36, 37, 38, -39, 40]
        %
        % ��ҽ���������о����볤����һ������˾ְ��ҽԺ����ƺ����ڳ��������ͱ����ֱ��������Ⱥ������֢���˽�����STAI�����Ĳ��ԡ��������ԭ���߽��ƵĽ����1.������Ⱥ������S-AI����Ϊ39.71��8.89���У�375������38.97��8.45��Ů��443������T-AI����Ϊ41.11��7.74���У���41.31��7.54��Ů��������֢��(50������S-AIΪ57.22��10.48��T-AIΪ46.22��26.22�����Ը���������Ⱥ��2.����������S-Al���������Բ��죻T-AI������50-55�����������ߣ�ƽ��42.8)��3.��ͬ�Ļ���������޲��졣4.��ְͬҵ����S-AI��T-AI�����־���Ů�Ըɲ�Ϊ��ͣ�ƽ��36. 7��39.6)��
        %
        % �������ݣ� �������ϲ��ϣ�����ɸѡ�������� [35,45] ����ı��ԡ�
        
    case 'LSAS'
        ques.items =  repmat({'���ڳ��ϴ�绰', '�μ�С��', '���ڳ��ϳԶ���', '�����������˹���', '����Ҫ����̸��', '������ǰ���ݡ���ʾ���ݽ�', '�μӾۻ�', '������ע���¹���', '����ע������д', '�벻̫��Ϥ���˴�绰', '�벻̫��Ϥ���˽�̸', '��İ���˻���', '�ڹ���������С��', '���������˾���������', '��Ϊ��ע������', '�ڻ����Ϸ���', '�μӲ���', '�Բ�̫��Ϥ���˱�ﲻͬ�Ĺ۵�Ϳ���', '�벻̫��Ϥ����Ŀ�����', '��С���л㱨', '���Ŵ�ʶĳ��', 'ȥ�̵��˻�', '��֯�ۻ�', '�ܾ�����Ա��ǿ������'}, 2,1);
        ques.title = {1, '������������ͬ�龰���罻�ֲ����������Ӱ�졣����ϸ�Ķ�ÿ���龰��\n\n���ش�������ص����⡣��һ������������ڸ��龰�¸е����ǻ�־�ĳ̶ȡ�\n\n�ڶ�������������ӱܸ��龰��Ƶ�ʡ�����������龰��ƽʱ���ᾭ����\n\n����������龰��'};
        ques.target = repmat({'�е�����/�־�̶�'; '�ӱܵ�Ƶ��'}, numel(ques.items)/2, 1);
        ques.instr = repmat([{'������������ͬ�龰���罻�ֲ����������Ӱ�졣����ϸ�Ķ�ÿ���龰��\n\n���ش�������ص����⡣����������龰��ƽʱ���ᾭ��������������龰��\n\n\n\n�ڸ��龰�¸е����ǻ�־�ĳ̶ȣ�'}, {'������������ͬ�龰���罻�ֲ����������Ӱ�졣����ϸ�Ķ�ÿ���龰�����ش�������ص����⡣\n\n����������龰��ƽʱ���ᾭ����\n\n����������龰��\n\n\n\n���ӱܸ��龰��Ƶ�ʣ�'}], 1, numel(ques.items)/2);
        ques.scales = repmat([{'��ȫû��','��Щ','�еȳ̶�','�ǳ�����'}; {'����û��','��Щ','����','�����������'}], numel(ques.items)/2, 1);
        ques.encode.scale = {'fear', 1:2:numel(ques.items); 'avoidance', 2:2:numel(ques.items)};
        ques.encode.inv = [];
        ques.thrsh = {[1 2], [15, 35]+numel(ques.items)/2, 0}; % threshould for LSAS, total score between [15, 35] not wanted; exp use 1:4 rather than 0:3, so add 1 for each scale point
        ques.isShowResult = 0;
        
        ques.items = ques.items(:);
        ques.instr = ques.instr(:);
        
        
        % Liebowitz Social Anxiety Scale Test
        % The Liebowitz Social Anxiety Scale (LSAS) is a questionnaire developed by Dr. Michael R. Liebowitz, a psychiatrist and researcher.
        %
        %     This measure assesses the way that social phobia plays a role in your life across a variety of situations.
        %     Read each situation carefully and answer two questions about that situation.
        %     The first question asks how anxious or fearful you feel in the situation.
        %     The second question asks how often you avoid the situation.
        %     If you come across a situation that you ordinarily do not experience, we ask that you imagine "what if you were faced with that situation," and then rate the degree to which you would fear this hypothetical situation and how often you would tend to avoid it. Please base your ratings on the way that the situations have affected you in the last week.
        %     Heimburg, R. G. & Becker, R. E. (2002). Cognitive-Behavioral Group Therapy for Social Phobia. New York, NY: The Guilford Press.
        %
        % Chinese:
        %
        %             SAD             NORMAL
        % FEAR        37.84(14.61)    12.30(9.21)
        % AVOID       31.80(14.90)    10.01(9.12)
        % TOTAL       69.59(28.65)    22.31(16.86)
        % ���ѧ������ʵ�� 2004, Vol.3, No.2
        %
        %
        %             Total           total.fear                     fear.socialinteraction   fear.performance     total.avoidance      avoidance.socialinteraction         avoidance.performance
        % patients    66.6/28.3       36.8/14.1                      16.4/6.7                 20.4/8.0             30.0/16.0            13.9/7.7                            16.1/8.7
        % normal      29.1/17.3       16.5/9.4                       7.4/4.7                  9.1/5.1              12.6/9.6             5.9/4.9                             6.8/5.3
        % �й����񼲲���־ 2006, Vol.32, No.3
        % 0 1 2 3
        % 'none' 'mild tolerable' 'moderate distressing' 'severe distrubing'
        % 'never(0%)' 'occasionally(1%-33%)'  'often(33%-66%)' 'usually(67%-100%)'
        %
        % 11 social: talking to prople in authority...
        % 13 performance: working while being observed...
        
    case 'test'
        ques.items = {'1', '2', '3','4','5'};
        ques.title = {'boring questionaire'};
        ques.target = repmat({'care?'}, numel(ques.items),1);
        ques.instr = repmat({'this is test!'}, numel(ques.items),1);
        ques.scales = repmat({'A','B', 'C', 'D'}, numel(ques.items),1);
        ques.encode.scale = {'a', 1:2:numel(ques.items); 'b', 2:2:numel(ques.items)};
        %����Ƿ��⣺
        ques.encode.inv = [numel(ques.items)-1 numel(ques.items)];
        ques.thrsh = {1, [-inf, inf], 1}; % for ques.encode.scale, {idx, [a b], isInGood}; or [] if no thrreshold required
        ques.isShowResult = 1; % whether show result for the participant
        
    otherwise
        error('no such questionaire in the database!');
end
end
