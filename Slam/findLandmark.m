function out = findLandmark(landmark, x, y, t, visionRange, visionAngle)

%Check if landmark is within vision range

lx = landmark(1);
ly = landmark(2);

lr = dist(lx-x,ly-y);

if(lx-x == 0)
    if(ly-y >= 0)
        lt = pi/2-t;
    else
        lt = 3*pi/2-t;
    end
else
    lt = atan( (ly-y)/(lx-x) ) - t;
end

if(lx-x < 0)
    lt = lt + pi;
end

lt = shiftAngle(lt);    %Shift angle to [-pi,pi]

if( lr <= visionRange && lr > 0.01 && lt <= visionAngle && lt >= -visionAngle)
    out = 1;
else
    out = 0;
end