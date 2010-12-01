clear all
clc
clf

global landmarks
global totalNumberLandmarks
global visionRange
global visionAngle
global Xreal
global dXreal;
global measRangeVar;
global measAngleVar;

%Errors: No measurement errors

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
[r1 r2] = initFigure(area);     %r1,r2 robot plot handlers

%Set landmarks
landmarks = setLandmarks(3);
temp = size(landmarks);
totalNumberLandmarks = temp(1);

%Set step size
stepLength = 0.30;
stepAngle = pi/180*30;
T = 0.1;
V = [stepLength/T, stepAngle/T];

%Vision parameters
visionRange = 3;
visionAngle = pi/180*17;

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

%--- FOR ROBOT CODE ---------------------------------

%Init landmarks                     *** FOR REAL CODE ***
maxNumberLandmarks = 50;
foundLandmarks = zeros(maxNumberLandmarks,2);
noFoundLandmarks = 0;
landmarkDistance = 0.5;            %Radius of circular area where new landmark is considered to be the same as the old one

%Robot init state                   *** FOR REAL CODE ***       %CHANGE to 0, 0, pi/2 in real code
xInit = 0;
yInit = 0;
tInit = pi/2;

%Odometry errors                     *** FOR REAL CODE ***
CC = [0.1 0;
      0 0.1];

%Measurement error (camera)           *** FOR REAL CODE ***
cr = 0.1;
cb = pi/180*5;

%Init covariance matrix P            *** FOR REAL CODE ***
P = 0.01*eye(3);
 
%Init system state                      *** FOR REAL CODE ***
X = [xInit yInit tInit]';


Xreal = X;  %Not part of algorithm


%Main loop                              %NOT LOOP IN REAL CODE
while(isWithinArea(area,X))
    
    stepNumber = stepNumber + 1;

%% Move robot                       NOT PART OF REAL CODE

    %Real robot movement
    dXreal = moveRobot(move, stepLength, stepAngle, Xreal, stepNumber);

    %Disturb robot movement
    dX = moveRobot(move, stepLength, stepAngle, X, stepNumber);     %real dX
    rangeError = stepLength * 2*rangeVar*(rand-0.5);
    angleError = stepAngle * 2*angleVar*(rand-0.5);
    
    dX = [dX(1) + rangeError*cos(X(3));
          dX(2) + rangeError*sin(X(3));
          dX(3) + angleError];
    
    % dX = transformMovement(dr, dt, X);                       *** FOR REAL CODE ***

    
%% Update current state from odometry
    
    %Update state, real position and covariance                 *** FOR REAL CODE ***
    [X, P] = updateFromOdometry(X, dX, P, CC);
    
    Xreal = Xreal + dXreal;    %Update real position
    
    %Plot estimated position from odometry
    [rRobot1 rRobot2 rRobot3] = plotRobot(X,2,visionRange,visionAngle);

%% Observe landmarks
    for i=1:(length(X)-3)/2
        foundLandmarks(i,1) = X(3+2*i-1);
        foundLandmarks(i,2) = X(3+2*i);
    end
    if(length(X) == 3)
        noFoundLandmarks2 = 0;
    else
        noFoundLandmarks2 = i;
    end
    
    [measurements, noMeasurements] = getLandmarks(X, maxNumberLandmarks);           %NOT FOR REAL CODE, WHERE MEASUREMENTS ARE INPUT
    
    [currentLandmarks, newLandmarks, reObservedLandmarks, noFoundLandmarks, noCurrentLandmarks, noNewLandmarks, noReObservedLandmarks] = ...
    observeLandmarks(X, measurements, noMeasurements, foundLandmarks, noFoundLandmarks, maxNumberLandmarks, landmarkDistance);

    rObs1 = plotLandmarks(reObservedLandmarks, 2);
    rObs2 = plotLandmarks(newLandmarks, 2);
    
    
%% Update state from re-observed landmarks
    for i=1:noReObservedLandmarks

        [X, P] = updateFromLandmarks(X, P, measurements(i,:), reObservedLandmarks(i,:), noFoundLandmarks, noNewLandmarks, cr, cb);
        
    end

    
%% Add new landmarks to the current state
    for i=1:noNewLandmarks

        [X, P] = addLandmark(newLandmarks(i,:), X, dX, cr, cb, P);
        
    end

    
%% Print error in position and angle
    errorPosition = dist(X(1)-Xreal(1),X(2)-Xreal(2))
    errorAngle = (X(3)-Xreal(3))*180/pi
    disp(' ')
    disp(' ')
    disp(' ')

%% Plot positions

    %Plot real position
    [rNewReal1 rNewReal2 rNewReal3] = plotRobot(Xreal,3,visionRange,visionAngle);

    %Plot estimated position
    [rNew1 rNew2 rNew3] = plotRobot(X,1,visionRange,visionAngle);

    %Plot real position of landmarks
    rReal = plotLandmarks(landmarks,3);

    %Plot estimated position of landmarks
    estimatedLandmarks = zeros((length(X)-3)/2,2);
    for k = 1:(length(X)-3)/2
        estimatedLandmarks(k,1) = X(3+2*k-1);
        estimatedLandmarks(k,2) = X(3+2*k);
    end
    rEst = plotLandmarks(estimatedLandmarks,1);

%% Get movement from keyboard and delete old positions from figure
    if(isWithinArea(area,X))
        %Get movement from keyboard
        
        [move pos] = getMovement(stepNumber,pos);
        
        while(move < 1 || move > 4)
            if(move == 5)
                disp('real distance and angle')
                [xx yy] = ginput(1);
                [dd aa] = findRangeBearing(xx, yy, Xreal);
                dist_angle = [dd aa].*[1 180/pi]
            elseif(move == 6)
                disp('estimated distance and angle')
                [xx yy] = ginput(1);
                [dd aa] = findRangeBearing(xx, yy, X);
                dist_angle = [dd aa].*[1 180/pi]
            end
            
            [move pos] = getMovement(stepNumber,pos);
        end
        
        %Delete old position
        delete(rNew1,rNew2,rNew3);
        delete(rNewReal1,rNewReal2,rNewReal3);
        delete(rReal,rEst,rObs1,rObs2);
        delete(rRobot1,rRobot2,rRobot3);
    end

end