clear all
clc
clf

%Errors: No measurement errors

%% Init

%Working area
xmin = 0;
xmax = 1;
ymin = 0;
ymax = 1;
area = [xmin xmax ymin ymax];

%Init figure
[r1 r2] = initFigure(area);     %r1,r2 robot plot handlers

%Set landmarks
landmarks = setLandmarks(1);
temp = size(landmarks);
totalNumberLandmarks = temp(1);

%Init landmarks
foundLandmarks = zeros(10,2);         %Currently max 10 landmarks
noFoundLandmarks = 0;

%Robot init state
xInit = 0.5;
yInit = 0.2;
tInit = pi/2;

%Set step size
stepLength = 0.05;
stepAngle = pi/30;

%Vision parameters
visionRange = 0.4;
visionAngle = pi/4;

%Odometry errors
CC =  0.01;

%Measurement error (camera)
cr = 0.01;
cb = pi/1800;

%Init covariance matrix P
P = 0.01*eye(3);
 
%Init system state
X = [xInit yInit tInit]';
Xreal = X;  %Not part of algorithm

%% Movement
stepNumber = 0;
move = 0;   %Initiate move for first step

while(isWithinArea(area,X))
    
    stepNumber = stepNumber + 1;

    %Real robot movement
    [dxReal, dyReal, dtReal] = moveRobot(move, stepLength, stepAngle, Xreal, stepNumber);

    %Disturb robot movement
    distX = 1+0.1*(rand-0.5);
    distY = 1+0.1*(rand-0.5);
    distT = 1+0.1*(rand-0.5);
    dx = dxReal * distX;
    dy = dyReal * distY;
    dt = dtReal * distT;

    %Observe landmarks
    [currentLandmarks, newLandmarks, reObservedLandmarks, noReObservedLandmarks, noCurrentLandmarks, noNewLandmarks] = ...
    observeLandmarks(landmarks, totalNumberLandmarks, visionRange, visionAngle, foundLandmarks, noFoundLandmarks);
%     
%     currentLandmarks = zeros(10,2);
%     newLandmarks = zeros(10,2);
%     reObservedLandmarks = zeros(10,3);
%     noReObservedLandmarks = 0;
%     noCurrentLandmarks = 0;
%     noNewLandmarks = 0;
%     for i=1:totalNumberLandmarks
%         if(findLandmark(landmarks(i,:), Xreal(1)+dx, Xreal(2)+dy, Xreal(3)+dt, visionRange, visionAngle))
%             noCurrentLandmarks = noCurrentLandmarks + 1;
%             currentLandmarks(noCurrentLandmarks,:) = landmarks(i,:);
%             old = 0;    %Check if was included in foundLandmarks
%             j = 1;
%             while(old == 0 && j <=10)
%                 if(landmarks(i,1) == foundLandmarks(j,1) && landmarks(i,2) == foundLandmarks(j,2) )
%                     old = 1;
%                     noReObservedLandmarks = noReObservedLandmarks + 1;
%                     reObservedLandmarks(noReObservedLandmarks,1:2) = landmarks(i,:);
%                     reObservedLandmarks(noReObservedLandmarks,3) = j;
%                 end
%                 j = j+1;
%             end
%             if(old == 0)
%                 noFoundLandmarks = noFoundLandmarks + 1;
%                 foundLandmarks(noFoundLandmarks,:) = landmarks(i,:);
%                 noNewLandmarks = noNewLandmarks + 1;
%                 newLandmarks(noNewLandmarks,:) = landmarks(i,:);
%             end
%         end
%     end
% 
%     foundLandmarks;
%     newLandmarks;
%     currentLandmarks;
%     reObservedLandmarks;
%     noFoundLandmarks;
%     noNewLandmarks;
%     noCurrentLandmarks;
%     noReObservedLandmarks

%% Update current state from odometry

    X(1:3) = [X(1)+dx X(2)+dy X(3)+dt]';

    Xreal = [Xreal(1)+dxReal Xreal(2)+dyReal Xreal(3)+dtReal]';    %Not part of algorithm

    AA = [1 0 -dy;
         0 1 dx;
         0 0 1];

    W = [dx dy dt]';

    Q = W*CC*W';

    Prr = P(1:3,1:3);
    Pri = P(1:3,4:end);
    Prr = AA*Prr*AA'+Q;
    Pri = AA*Pri;

    P(1:3,1:3) = Prr;
    P(1:3,4:end) = Pri;

    [rRobot1 rRobot2 rRobot3] = plotRobot(X(1),X(2),X(3),2,visionRange,visionAngle);

    %% Update state from re-observed landmarks
    for i=1:noReObservedLandmarks

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

        R = [cr*r 0;
             0 cb];

         %Fing h = range and bearing of landmark from odometry and previous
         %position of landmark
        if(lx-x == 0)
            if(ly-y >= 0)
                tt = pi/2-t;
            else        %SOMETHING WRONG HERE
                tt = 3*pi/2-t;
            end
        else
            tt = atan( (ly-y)/(lx-x) ) - t;
        end

        if(lx-x < 0)
            tt = tt + pi;
        end

        tt = shiftAngle(tt);    %Shift angle to [-pi,pi]

        h = [dist(lx-x,ly-y);
             tt];


        K = P*H'*(H*P*H'+R)^-1;

        %Find z = measured range and bearing of landmark
        zx = reObservedLandmarks(i,1);
        zy = reObservedLandmarks(i,2);
        zr = dist(zx-Xreal(1),zy-Xreal(2));
        if(zx-Xreal(1) == 0)
            if(zy-Xreal(2) >= 0)
                zt = pi/2-Xreal(3);
            else
                zt = 3*pi/2-Xreal(3);
            end
        else
            zt = atan( (zy-Xreal(2))/(zx-Xreal(1)) ) - Xreal(3);
        end
        if(zx-Xreal(1) < 0)
            zt = zt + pi;
        end

        zt = shiftAngle(zt);    %Shift angle to [-pi,pi]

        z = [zr; zt];

        %K(:,2) = zeros(length(K),1);

        z_h = z-h
        K
        %Filter
        X = X + K*(z-h);
    end

%% Add new landmarks to the current state
    for i=1:noNewLandmarks

        lx = newLandmarks(i,1);
        ly = newLandmarks(i,2);
        x = X(1);
        y = X(2);
        t = X(3);
        r = sqrt( (lx-x)^2 + (ly-y)^2 );

        R = [cr*r 0;
             0 cb];

        Jxr = [1 0 -dy;
               0 1 dx];

        Jz = [cos(X(3)+dt), ( -dy*cos(dt) -dx*sin(dt) );
              sin(X(3)+dt), ( dx*cos(dt) - dy*sin(dt) )];

        XX = [X ; newLandmarks(i,1) ; newLandmarks(i,2)];

        Prr = P(1:3,1:3);
        Pri = P(4:end,1:3);

        P_N1N1 = Jxr*Prr*Jxr' + Jz*R*Jz';

        P_rN1 = Prr*Jxr';
        P_N1r = P_rN1';

        P_N1i = Jxr*Pri';
        P_iN1 = P_N1i';

        Pright = [P_N1r' ; P_iN1];
        Pbottom = [P_rN1' P_N1i P_N1N1];

        P = [P Pright ; Pbottom];

        X = XX;

    end

    %Print out error
    errorPosition = dist(X(1)-Xreal(1),X(2)-Xreal(2))
    errorAngle = X(3)-Xreal(3)
    disp(' ')
    disp(' ')
    disp(' ')

    %Plot real position
    [rNewReal1 rNewReal2 rNewReal3] = plotRobot(Xreal(1),Xreal(2),Xreal(3),3,visionRange,visionAngle);

    %Plot estimated position
    [rNew1 rNew2 rNew3] = plotRobot(X(1),X(2),X(3),1,visionRange,visionAngle);

    %Plot real position of landmarks
    rReal = plotLandmarks(landmarks,3);

    %Plot estimated position of landmarks
    estimatedLandmarks = zeros((length(X)-3)/2,2);
    for k = 1:(length(X)-3)/2
        estimatedLandmarks(k,1) = X(3+2*k-1);
        estimatedLandmarks(k,2) = X(3+2*k);
    end
    rEst = plotLandmarks(estimatedLandmarks,1);

    %sum(sum(P(1:3,1:3)))
    if((X(1)<1 && X(1)>0 && X(2)<1 && X(2)>0))

        %Get movement from keyboard
        if(stepNumber == 1) %Needs to be included due to some bug in keyinfo
            pos = 0;
            pause();
            keyinfo;
            while(pos == 0)
                pause();
                data = keyinfo;
                if(data(1)==38)
                    pos = 1;
                elseif(data(2)==38)
                    pos = 2;
                elseif(data(3)==38)
                    pos = 3;
                end
            end
        end
        pause();
        data = keyinfo;
        if(data(pos) == 38)
            move = 1;
        elseif(data(pos) == 40)
            move = 2;
        elseif(data(pos) == 37)
            move = 3;
        elseif(data(pos) == 39)
            move = 4;
        else
            move = 0;
            disp('error')
            pause();
        end
        move

        %Delete old position
        delete(rNew1,rNew2,rNew3);
        delete(rNewReal1,rNewReal2,rNewReal3);
        delete(rReal,rEst);
        delete(rRobot1,rRobot2,rRobot3);
    end

end