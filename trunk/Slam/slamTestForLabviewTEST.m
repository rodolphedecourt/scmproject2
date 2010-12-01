function [X, P, dX, measurements] = slamTestForLabview(a)

shit = a;

%FIX:   - Associate depending on variance. EDIT: Will not do, better just use eucledian distance
%       - Only accept landmarks observed at least N times. EDIT: Will not be done
%       - Remove not observed landmarks??

%% Init

%--- ONLY FOR SIMULATION -----------------------

%Working area
xmin = -2.5;
xmax = 2.5;
ymin = -2.5;
ymax = 2.5;
area = [xmin xmax ymin ymax];

%Init figure
%[r1 r2] = initFigure(area);     %r1,r2 robot plot handlers

%rObs = plotLandmarks([0,0], 2);         %Init estimation markers

%Set landmarks
landmarkDistance = 1;
distToEdge = 0.5;
landmarks = setLandmarks(3);
%landmarks = setLandmarks2(area, landmarkDistance, distToEdge);
temp = size(landmarks);
totalNumberLandmarks = temp(1);

%Set step size
stepLength = 0.30;
stepAngle = pi/180*30;

%Vision parameters
visionRange = 3;
visionAngle = pi/180*20;

%Init movement
stepNumber = 0;
move = 0;   %Initiate move for first step
pos = 0;    %Needed for keyboard interaction

%Robot error
rangeVar = 0.05;      %Max percentage error, uniform between 1-rangeVar and 1+rangeVar
angleVar = 0.05;       %Max percentage error, uniform between 1-angleVar and 1+angleVar

%Measurement error
measRangeVar = 0.05;
measAngleVar = 0.05;

%Init landmarks                 NOT for robot, be sure to use same as in SLAM.m
maxNumberLandmarks = 50;

%Odometry errors                NOT for robot, be sure to use same as in SLAM.m
CC = [0.1 0;
      0 0.1];



%-------------- FOR ROBOT CODE ---------------------------------

%Robot init state                   ****** FOR REAL CODE ******
xInit = 0;
yInit = 0;
tInit = pi/2;

%Init covariance matrix P            ****** FOR REAL CODE ******
P = 0.01*eye(3);
 
%Init system state                      ****** FOR REAL CODE ******
X = [xInit yInit tInit]';




Xreal = X;  %Not part of algorithm


%Main loop                              %NOT LOOP IN REAL CODE
%while(isWithinArea(area,X))
    
    %stepNumber = stepNumber + 1;

%% Move robot                       NOT PART OF REAL CODE

    %Real robot movement
    dXreal = moveRobot(1, stepLength, stepAngle, Xreal, stepNumber);

    %Disturb robot movement
    dX = moveRobot(1, stepLength, stepAngle, X, stepNumber);     %real dX
    rangeError = stepLength * 2*rangeVar*(rand-0.5);
    angleError = stepAngle * 2*angleVar*(rand-0.5);
    
    dX = [dX(1) + rangeError*cos(X(3));
          dX(2) + rangeError*sin(X(3));
          dX(3) + angleError];
    
    % dX = transformMovement(dr, dt, X);                       %****** FOR REAL CODE ******
    
%% Update real position

    Xreal = Xreal + dXreal;    %Update real position

%% Update current state from odometry temporarily to calculate fictive measured values and plot estimated position

%Update state, real position and covariance
[Xtemp, Ptemp] = updateFromOdometry(X, dX, P, CC);

%NOT FOR REAL CODE, WHERE MEASUREMENTS ARE INPUT
[measurements, noMeasurements, landmarks, totalNumberLandmarks, visionRange, visionAngle, Xreal, measRangeVar, measAngleVar]...
    = getLandmarksForLabviewSim(X, maxNumberLandmarks, landmarks, totalNumberLandmarks, visionRange, visionAngle, Xreal, measRangeVar, measAngleVar);


%X
%P
%dX
%measurements

%[Xout, Pout, Xodometry, measuredLandmarks] = SLAM(X, P, dX, measurements)
