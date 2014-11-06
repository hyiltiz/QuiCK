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
- [Download the `.zip` file](https://github.com/hyiltiz/QQQ/archive/master.zip) from this Github page;
- Install [Psychtoolbox 3.0](http://psychtoolbox.org/download/) if you are using `QQQ` with Psychtoolbox;
- import your questionaire data in `quesDB.m` following the templates provided in the file;
- just run `StaticChoice(YourQuestionaireDB)`;
- the raw results and encoded results are automatically generated.

_Info:_ You could also run `QQQ` from vanilla `MATLAB` (or `GNU/Octave`) by turning of `Screen` mode switch.

To use this demo:
- Download all the files and folders (except .exe files, the demo does not depend on them) for your local drive.
- Open your MATLAB and CD to the folder you have downloaded the code.
- Run the main functions, such as RL_PLW. (you may need to change them for language support.)
