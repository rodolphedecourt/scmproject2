function [move, pos] = getMovement(stepNumber, pos);

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
if(data(pos) == 38) %forward
    move = 1;
elseif(data(pos) == 40) %backwards
    move = 2;
elseif(data(pos) == 37) %left
    move = 3;
elseif(data(pos) == 39) %right
    move = 4;
elseif(data(pos) == 82) %measure distance and angle to real landmark
    move = 5;
elseif(data(pos) == 69) %measure distance and angle to estimated landmark
    move = 6;
else
    move = 0;
    disp('error')
    pause();
end