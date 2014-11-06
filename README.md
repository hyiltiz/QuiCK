# Quick Qostomizable Questionaire (QQQ) Documentation

## What it is?
Quick Qostomizable Questionaire (QQQ) is an user-friendly toolbox for MATLAB (or GNU/Octave) that aims to aid scientific survers providing:

- several ready-to-use structures as templates;
- high-precision reaction time capture;
- support for multiple choice questions with several and/or several answers;
- support for Psychtoolbox (OpenGL) that integrates seamlessly with your current psychophysics experiments.
- costumizable instructions for each items in your questionaire or blocks of items (sub-scales) that could be used to split your questionaire in half or in any other manner;
- automatically encode to generate the result for each sub-scales;
- result-based splitting of your participants for further experimentation.

## Usage

QQQ is a free software released under GNU General Public Lisence 3 or later, and stays free for ever. You can always download your own copy and use it for any purpose. Simply follow the steps:

1. [Download the `.zip` file](https://github.com/hyiltiz/QQQ/archive/master.zip) from this Github page;
1. Install [Psychtoolbox 3.0](http://psychtoolbox.org/download/) if you are using `QQQ` with Psychtoolbox;
1. import your questionaire data in `quesDB.m` following the templates provided in the file;
1. just run `StaticChoice(YourQuestionaireDB)`;
1. the raw results and encoded results are automatically generated.

_Info:_ You could also run `QQQ` from vanilla `MATLAB` (or `GNU/Octave`) by turning of `Screen` mode switch.
