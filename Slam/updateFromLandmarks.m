function [X, P] = updateFromLandmarks(X, P, measurement, landmarkNumber, cr, cb)

%Calculate matrix H
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

temp = size(X);
lengthX = temp(1);

H = zeros(2,lengthX);
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

% %Find z = measured range and bearing of landmark from real position
% %of landmark and real position of robot
% zx = reObservedLandmark(1);
% zy = reObservedLandmark(2);
% [zr zt] = findRangeBearing(zx, zy, Xreal(1:3));                     %ERRORRRRRRRRRRRRRRRR!! SHOULD USE MEASUREMENTS
% z = [zr; zt]

%Measured range and bearing
z = measurement';

%K(:,2) = zeros(length(K),1);

%z_h = (z-h).*[1; 180/pi];
%K
%Filter
X = X + K*(z-h);

P = (eye(lengthX) - K*H) * P;