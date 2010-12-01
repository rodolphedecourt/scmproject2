function out = isWithinArea(area,X)

xmin = area(1);
xmax = area(2);
ymin = area(3);
ymax = area(4);

x = X(1);
y = X(2);

if( x>xmin && x<xmax && y>ymin && y<ymax)
    out = 1;
else
    out = 0;
end