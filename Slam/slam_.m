clear all
clc
clf

%Errors: No measurement errors
%        Which landmarks are measured, from real or estimated position and real or estimated landmarks?

%% Init
%Init figure
[r1 r2] = initFigure();

%Robot init state
xInit = 0.5;
yInit = 0.1;
tInit = pi/2;

%Vision parameters
visionRange = 0.4;
visionAngle = pi/4;

%Landmarks
landmarks = [0.1 0.4;
             0.2 0.6;
             0.2 0.5
             0.8 0.5;
             0.1 0.1;
             0.2 0.2;
             0.55 0.6;
             %0.4 0.65;
             0.4 0.3];
si = size(landmarks);

%Odometry errors
CC =  0.01;

%Measurement error (camera)
cr = 0.01*0.01;
cb = 0.01*pi/180;

%Init covariance matrix P
P = 0.01*eye(3);
 
%Init system state
X = [xInit yInit tInit]';
Xreal = X;  %Not part of algorithm

%Init landmarks
foundLandmarks = zeros(10,2);         %Currently max 10 landmarks
noFoundLandmarks = 0;

%% Movement
noStep = 30;
for jj=1:noStep

%Robot movement
if(jj == 1) %No movement in first step
    dxReal = 0;
    dyReal = 0;
    dtReal = 0;
else
    dxReal = 0.03;
    dyReal = 0.05;
    dtReal = pi/30;
end

%Disturbed robot movement
cc1 = 1+0.2*(rand-0.5);
cc2 = 1+0.2*(rand-0.5);
cc3 = 1+0.2*(rand-0.5);
dx = dxReal * cc1;%(rand/10+0.95);
dy = dyReal * cc2;%(rand/10+0.95);
dt = dtReal * cc3;%(rand/10+0.95);

%Observe landmarks
currentLandmarks = zeros(10,2);
newLandmarks = zeros(10,2);
reObservedLandmarks = zeros(10,3);
noReObservedLandmarks = 0;
noCurrentLandmarks = 0;
noNewLandmarks = 0;
for i=1:si(1)
    if(findLandmark(landmarks(i,:), Xreal(1)+dx, Xreal(2)+dy, Xreal(3)+dt, visionRange, visionAngle))
        noCurrentLandmarks = noCurrentLandmarks + 1;
        currentLandmarks(noCurrentLandmarks,:) = landmarks(i,:);
        old = 0;    %Check if was included in foundLandmarks
        j = 1;
        while(old == 0 && j <=10)
            if(landmarks(i,1) == foundLandmarks(j,1) && landmarks(i,2) == foundLandmarks(j,2) )
                old = 1;
                noReObservedLandmarks = noReObservedLandmarks + 1;
                reObservedLandmarks(noReObservedLandmarks,1:2) = landmarks(i,:);
                reObservedLandmarks(noReObservedLandmarks,3) = j;
            end
            j = j+1;
        end
        if(old == 0)
            noFoundLandmarks = noFoundLandmarks + 1;
            foundLandmarks(noFoundLandmarks,:) = landmarks(i,:);
            noNewLandmarks = noNewLandmarks + 1;
            newLandmarks(noNewLandmarks,:) = landmarks(i,:);
        end
    end
end

foundLandmarks;
newLandmarks;
currentLandmarks;
reObservedLandmarks;
noFoundLandmarks;
noNewLandmarks
noCurrentLandmarks
noReObservedLandmarks

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

    lx = reObservedLandmarks(i,1);
    ly = reObservedLandmarks(i,2);
    landmarkNumber = reObservedLandmarks(i,3);
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
        else
            tt = 3*pi/2-t;
        end
    else
        tt = atan( (ly-y)/(lx-x) );
    end
    
    if(lx-x < 0)
        tt = tt + pi;
    end
    
    h = [dist(lx-x,ly-y);
         tt - t];
     
     
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
    if(zx-x < 0)
        zt = zt + pi;
    end
    
    z = [zr; zt];
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

%X
Xreal

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
if(jj~=noStep)
    delete(rNew1,rNew2,rNew3);
    delete(rNewReal1,rNewReal2,rNewReal3);
    delete(rReal,rEst);
    delete(rRobot1,rRobot2,rRobot3);
end


end