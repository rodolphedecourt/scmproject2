function dXreal = moveRobot(move, stepLength, stepAngle, Xreal, stepNumber)

%Robot movement
if(stepNumber == 1) %No movement in first step
    dxReal = 0;
    dyReal = 0;
    dtReal = 0;
else
    if(move == 1)
        dxReal = stepLength*cos(Xreal(3));
        dyReal = stepLength*sin(Xreal(3));
        dtReal = 0;
    elseif(move == 2)
        dxReal = -stepLength*cos(Xreal(3));
        dyReal = -stepLength*sin(Xreal(3));
        dtReal = 0;
    elseif(move == 3)
        dxReal = 0;
        dyReal = 0;
        dtReal = stepAngle;
    elseif(move == 4)
        dxReal = 0;
        dyReal = 0;
        dtReal = -stepAngle;
    else
        dxReal = 0;
        dyReal = 0;
        dtReal = 0;
    end
end

dXreal = [dxReal dyReal dtReal]';