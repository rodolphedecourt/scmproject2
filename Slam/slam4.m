clear all
clc
clf

global landmarks
global totalNumberLandmarks
global visionRange
global visionAngle
global Xreal
global dXreal;

%Errors: No measurement errors

%FIX:   - Associate depending on variance 
%       - Only accept landmarks observed at least N times
%       - Remove not observed landmarks??

%% Init

%--- ONLY FOR SIMULATION -----------------------

%Working area
xmin = 0;
xmax = 5;
ymin = 0;
ymax = 5;
area = [xmin xmax ymin ymax];

%Init figure
[r1 r2] = initFigure(area);     %r1,r2 robot plot handlers

%Set landmarks
landmarks = setLandmarks(3);
temp = size(landmarks);
totalNumberLandmarks = temp(1);

%Set step size
stepLength = 0.10;
stepAngle = pi/180*10;
T = 0.1;
V = [stepLength/T, stepAngle/T];

%Vision parameters
visionRange = 2;
visionAngle = pi/4;

%Init movement
stepNumber = 0;
move = 0;   %Initiate move for first step
pos = 0;    %Needed for keyboard interaction

%--- FOR ROBOT CODE ---------------------------------

%Init landmarks                     *** FOR REAL CODE ***
maxNumberLandmarks = 50;
foundLandmarks = zeros(maxNumberLandmarks,2);
noFoundLandmarks = 0;
landmarkDistance = 0.1;            %Radius of circular area where new landmark is considered to be the same as the old one

%Robot init state                   *** FOR REAL CODE ***
xInit = 0.3;
yInit = 0.4;
tInit = pi/4;

%Odometry errors                     *** FOR REAL CODE ***
CC = [0.1 0;
      0 0.1];

%Measurement error (camera)           *** FOR REAL CODE ***
cr = 0.1;
cb = pi/180*5;

%Init covariance matrix P            *** FOR REAL CODE ***
P = 0.0001*eye(3);
 
%Init system state                      *** FOR REAL CODE ***
X = [xInit yInit tInit]';
Xreal = X;  %Not part of algorithm


%Main loop
while(isWithinArea(area,X))
    
    stepNumber = stepNumber + 1;

%% Move robot

    %Real robot movement
    dXreal = moveRobot(move, stepLength, stepAngle, Xreal, stepNumber);

    %Disturb robot movement
    dX = moveRobot(move, stepLength, stepAngle, X, stepNumber);
    distX = [1+0.1*(rand-0.5);
             1+0.1*(rand-0.5);
             1+0.1*(rand-0.5)];
    dX = dX.*distX;
    
    % dX = getMovement();                       *** FOR REAL CODE ***

    
%% Observe landmarks
    for i=1:(length(X)-3)/2
        foundLandmarks(i,1) = X(3+2*i-1);
        foundLandmarks(i,2) = X(3+2*i);
    end
    [currentLandmarks, newLandmarks, reObservedLandmarks, noFoundLandmarks, noCurrentLandmarks, noNewLandmarks, noReObservedLandmarks] = ...
    observeLandmarks(X, foundLandmarks, noFoundLandmarks, maxNumberLandmarks, landmarkDistance);

    rObs1 = plotLandmarks(reObservedLandmarks, 2);
    rObs2 = plotLandmarks(newLandmarks, 2);

%% Update current state from odometry
    
    %Update state, real position and covariance
    [X, Xreal, P] = updateFromOdometry(X, dX, Xreal, dXreal, P, CC, V);
    
    %Plot estimated position from odometry
    [rRobot1 rRobot2 rRobot3] = plotRobot(X,2,visionRange,visionAngle);

    
%% Update state from re-observed landmarks
    for i=1:noReObservedLandmarks

        %Calculate matrix H
        landmarkNumber = reObservedLandmarks(i,3);
        lx = X(4+2*landmarkNumber-2);
        ly = X(4+2*landmarkNumber-1);
        
        x = X(1);
        y = X(2);
        t = X(3);
        
        r = dist(lx-x,ly-y);
        A = (x-lx)/r;
        B = (y-ly)/r;
        C = 0;
        D = (ly-y)/r^2;
        E = (lx-x)/r^2;
        F = -1;

        H = zeros(2,3+2*(noFoundLandmarks-noNewLandmarks));
        H(:,1:3) = [A B C;
                    D E F];
        H(:,(4+2*landmarkNumber-2):(4+2*landmarkNumber-1)) = [-A -B; -D -E];

        %Matrix R
        R = [cr*r 0;
             0 cb];
         
        %Kalman filter
        K = P*H'*(H*P*H'+R)^-1;
        
        
        %Fing h = range and bearing of landmark from odometry and previous
        %estimated
        %position of landmark
        [hr ht] = findRangeBearing(lx, ly, X(1:3));
        h = [hr ht]';
        
        %Find z = measured range and bearing of landmark from real position
        %of landmark and real position of robot
        zx = reObservedLandmarks(i,1);
        zy = reObservedLandmarks(i,2);
        [zr zt] = findRangeBearing(zx, zy, Xreal(1:3));
        z = [zr; zt];

        %K(:,2) = zeros(length(K),1);

        z_h = (z-h).*[1; 180/pi];
        %K
        %Filter
        X = X + K*(z-h);
        
        P = (eye(3+2*(noFoundLandmarks-noNewLandmarks)) - K*H) * P;
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
    
    %foundLandmarks

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