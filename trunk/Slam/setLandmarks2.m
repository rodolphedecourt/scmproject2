function landmarks = setLandmarks2(area, landmarkDistance, distToEdge)

xmin = area(1);
xmax = area(2);
ymin = area(3);
ymax = area(4);

noX = floor( (xmax-xmin-2*distToEdge)/landmarkDistance ) + 1     %No landmarks in x direction
noY = floor( (ymax-ymin-2*distToEdge)/landmarkDistance ) + 1     %No landmarks in y direction

noLandmarks = 2*noX+2*noY-4;

landmarks = zeros(noLandmarks,2);

for i=1:noX
    landmarks(i,1) = xmin + (i-1)*landmarkDistance + distToEdge;
    landmarks(i,2) = ymin + distToEdge;
end

for i=1:noY-1
    landmarks(noX+i,1) = xmin + (noX-1)*landmarkDistance + distToEdge;
    landmarks(noX+i,2) = ymin + i*landmarkDistance + distToEdge;
end

for i=1:noX-1
    landmarks(noX+noY-1+i,1) = xmin + (noX-i-1)*landmarkDistance + distToEdge;
    landmarks(noX+noY-1+i,2) = ymin + (noY-1)*landmarkDistance + distToEdge;
end

for i=1:noY-2
    landmarks(2*noX+noY-2+i,1) = xmin + distToEdge;
    landmarks(2*noX+noY-2+i,2) = ymin + (noY-i-1)*landmarkDistance + distToEdge;
end
