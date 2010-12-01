function r3 = plotVision(x,y,t,col,visionRange,visionAngle)

radi = visionRange;
angle = visionAngle;

p0 = [x,y];
p1 = [x+radi*cos(t+angle), y+radi*sin(t+angle)];
p2 = [x+radi*cos(t-angle), y+radi*sin(t-angle)];
p3 = [x+radi*cos(t+angle/2), y+radi*sin(t+angle/2)];
p4 = [x+radi*cos(t-angle/2), y+radi*sin(t-angle/2)];
p5 = [x+radi*cos(t), y+radi*sin(t)];

positions = [p0; p1; p3; p5; p4; p2; p0];
r3 = plot(positions(:,1),positions(:,2),'--');
set(r3, 'Color', col);