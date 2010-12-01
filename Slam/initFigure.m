function [r1 r2] = initFigure(area);

xmin = area(1);
xmax = area(2);
ymin = area(3);
ymax = area(4);

%Create figure
cornersX = [xmin xmin xmax xmax xmin];
cornersY = [ymin ymax ymax ymin ymin];

plot(cornersX,cornersY);
axis([xmin xmax ymin ymax]);
hold on

%Initiate robot plot handlers
r1 = plot(0,0,'x');
r2 = plot(0,0,'x');

