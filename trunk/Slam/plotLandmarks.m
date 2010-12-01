function r = plotLandmarks(landmarks,c)

if c == 1
    col = 'r';
elseif c == 2
    col = 'g';
elseif c == 3
    col = 'b';
else
    col = 'black';
end

X = landmarks(:,1);
Y = landmarks(:,2);

r = plot(X,Y,'xg');

set(r, 'Color', col);