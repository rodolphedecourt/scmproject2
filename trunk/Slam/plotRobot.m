function [r1 r2 r3] = plotRobot(X,c)

global visionRange;
global visionAngle;

x = X(1);
y = X(2);
t = X(3);

%Triangle size
rw = 0.2;
rh = 0.4;
rl = 2*rh/3;
rs = sqrt((rh/3)^2+(rw/2)^2);
alpha = atan((rw/2)/(rh/3));
beta = pi-alpha;

triangleX = [x x x x] + [rl*cos(t) rs*cos(t+beta) rs*cos(t+pi+alpha) rl*cos(t)];
triangleY = [y y y y] + [rl*sin(t) rs*sin(t+beta) rs*sin(t+pi+alpha) rl*sin(t)];

if c == 1
    col = 'r';
elseif c == 2
    col = 'g';
elseif c == 3
    col = 'b';
else
    col = 'black';
end

r1 = plot(triangleX,triangleY);
r2 = plot(x,y,'rx');

set(r1, 'Color', col);
set(r2, 'Color', col);

r3 = plotVision(x,y,t,col,visionRange,visionAngle);

title('blue=real position, green=position from odometry, red=estimated position')
