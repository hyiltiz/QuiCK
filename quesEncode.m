function [ques, responseM] = quesEncode(ques, responseC)
% convect and calculate output according to response chars and ques.encode
% result is ques.encdoe.scale{:,3} and responseM
% There are two methods to specify the encoding of the questionaire in the ques.encode structure:
%   default: ques.encode.scale = {'Sub-Scale Type: A', [1,3,5,6,7]; 'Sub-Scale Type: B', [2,4,8,9]}
%            ques.encode.inv = [1 3 5]
%
%            In this method, the total points fdor each of the subscale defined in the ques.encode.scale
%            is calculated based on the order number of the selected answer in responseC, e.g. when a five
%            Likert scale is used, the point for the first choice (A) is 1, for the second choice (B) is 2,
%            for the fifth choice (E) is 5 and so on. When ques.encode.inv is defined, responses for those
%            items gain a point based on the reverse order, e.g. 2 for the third choice (C) in a five Likert
%            scale.
%
%   manual: ques.encode.scale = {'Sub-scale type: A', [1 2 4 5; 1 1 2 3; 3 1 -2 0]}
%            In this method, a three-by-n matrix containing encoding rules for each sub-scale should be specified.
%            The first row specifies the #item in the scale, the second row specifies the #choice for that item and
%            the third row specifies the points given for that choice in that item. For example, the chart below
%            corresponds to the example above:
%            Subscale A:
%               Items   Choice  Points
%               1       A       3
%               2       A       1
%               4       B       -2
%               5       C       0
%
%            In this manual method, using ques.encode.inv is not recommended since the value for each choice
%            could be explicitly specified [rather than implied by order].
%
%   Note that in most cases, it is possible to change the original encoding rule of the questionaire to just apply
%   the default encoding.
%
%

% responseM = str2num(responseC);
responseM = str2double(responseC);

if ~isempty(ques.encode.inv)
    responseM(ques.encode.inv) = size(ques.scales, 2) + -1*responseM(ques.encode.inv);
end

for ipar=1:size(ques.encode.scale,1)
    switch size(ques.encode.scale{ipar,2}, 1)
        case 1
            ques.encode.scale{ipar,3} = sum(responseM(ques.encode.scale{ipar,2}));
        case 3
            ques.encode.scale{ipar,3} = sum(ques.encode.scale{ipar,2}(3, ques.encode.scale{ipar,2}(2,:)'==responseM(ques.encode.scale{ipar,2}(1,:))));
        otherwise
            error('Could not understand encoding method. See `help quesEncode'' for more details.');
end
end
