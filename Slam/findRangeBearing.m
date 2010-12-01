function [rr, tt] = findRangeBearing(lx, ly, X);

x = X(1);
y = X(2);
t = X(3);

rr = dist(lx-x,ly-y);

if(lx-x == 0)
    if(ly-y >= 0)
        tt = pi/2;
    else
        tt = 3*pi/2;
    end
else
    tt = atan( (ly-y)/(lx-x) );
end

if(lx-x < 0)
    tt = tt + pi;
end

tt = tt - t;    

tt = shiftAngle(tt);    %Shift angle to [-pi,pi]