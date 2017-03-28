 %% PTB parameters

    % Screen Preferences
    Screen('Preference', 'VBLTimestampingMode', 3);%Add this to avoid timestamping problems
    Screen('Preference', 'DefaultFontName', 'Geneva');
    Screen('Preference', 'DefaultFontSize', 30); %fontsize
    Screen('Preference', 'DefaultFontStyle', 0); % 0=normal,1=bold,2=italic,4=underline,8=outline,32=condense,64=extend,1+2=bold and italic.
    Screen('Preference', 'DefaultTextYPositionIsBaseline', 1); % align text on a line 
    
    % Colors definition
    white = [255 255 255]; 
    black = [0 0 0]; 
    red= [255 0 0]; 
    
    % Keyboard parameters
    KbName('UnifyKeyNames');
    keyLeft=KbName('leftArrow');
    keyRight=KbName('rightArrow');
    
    % Start PTB
    screens=Screen('Screens');
    Screen('Preference', 'SkipSyncTests', 2);
    screenNumber=max(screens); % Main screen
    [win,winRect] = Screen('OpenWindow',screenNumber,black);
    HideCursor;

%% Load stimuli

    Lose=imread(fullfile('Stimfiles', 'Lose.png')); 
    texLose = Screen('MakeTexture', win, Lose);
    Win=imread(fullfile('Stimfiles', 'Win.png')); 
    texWin = Screen('MakeTexture', win, Win);
    Play=imread(fullfile('Stimfiles', 'Play.png')); 
    texPlay = Screen('MakeTexture', win, Play);
    Pause=imread(fullfile('Stimfiles', 'Pause.png')); 
    texPause = Screen('MakeTexture', win, Pause);
    
%% Stimuli size & positions 
    %Play
    [imageHeight, imageWidth, colorChannels] = size(Play);
    imagePlay = [0 0 imageWidth imageHeight];
    imagePlay = [0 0 imageWidth./10 imageHeight./10];
    
    %Pause
    [imageHeight, imageWidth, colorChannels] = size(Pause);
    imagePause = [0 0 imageWidth imageHeight];
    imagePause = [0 0 imageWidth./10 imageHeight./10];
    
    xc = winRect(3)/2;
    yc = winRect(4)/2;
    xcOffsetLeft = xc-250;              %to position left image
    xcOffsetRight = xc+150;             %to position right image

    %Screen when Play is on the left and Pause is on the right
    imageRectPlayLeft = [xcOffsetLeft, yc, xcOffsetLeft+(imagePlay(:,3)) yc+(imagePlay(:,4))];
    imageRectPauseRight = [xcOffsetRight, yc, xcOffsetRight+(imagePause(:,3)), yc+(imagePause(:,3))];
    
    %Screen when Pause is on the left and Play is on the right
    imageRectPlayRight = [xcOffsetRight, yc, xcOffsetRight+(imagePlay(:,3)), yc+(imagePlay(:,3))];
    imageRectPauseLeft = [xcOffsetLeft, yc, xcOffsetLeft+(imagePause(:,3)), yc+(imagePause(:,3))];

    %Win Center
    [imageHeight, imageWidth, colorChannels] = size(Win); %get size of image
    imageWin = [0 0 imageWidth imageHeight]; %define image rect
    destinationRectWin = CenterRect(imageWin,winRect); %center Win
    imageWinRect = imageWin./10;
    destinationRectWin = CenterRect(imageWinRect,winRect);
    
    %Lose Center
    [imageHeight, imageWidht, colorChannels] = size(Lose);
    imageLose = [0 0 imageWidth imageHeight];
    destinationRectLose = CenterRect(imageLose,winRect);
    imageLoseRect = imageLose./10;
    destinationRectLose = CenterRect(imageLoseRect,winRect);
