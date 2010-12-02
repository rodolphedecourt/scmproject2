function [FreePath, Distance] = createEdge(Map,node1,node2)
% [FreePath, Distance] = createEdge(Map,node1,node2)
% 
% Function to see if there is a free path between two nodes.
% FreePath is 1 if there is a free path and 0 otherwise
% Distance is the distance between the nodes.
%
% Map is a matrix where all elements with 0 is free space.
% node1 and node2 is position of the nodes like
% node1 = [x1 y1] and 
% node2 = [x2 y2]


distHorizontal = abs(node1(1)-node2(1));
distVertical = abs(node1(2)-node2(2));

maxDist = max(distHorizontal,distVertical);
if node1(1) > node2(1)
    xmin = node2(1);
else
    xmin = node1(1);
end
if node1(2) > node2(2)
    ymin = node2(2);
else
    ymin = node1(2);
end

line = zeros(1,2*maxDist);
if distHorizontal == distVertical % diagonal
    for k=1:maxDist-1
        line(k) = Map(xmin+k,ymin+k);
    end
elseif distHorizontal <= distVertical % horizontal distance is less
    for k=1:maxDist-1
        HorizontalIndex = [floor(k*distHorizontal/distVertical) ceil(k*distHorizontal/distVertical)]+xmin;
        line(2*k-1) = Map(HorizontalIndex(1),ymin+k);
        line(2*k) = Map(HorizontalIndex(2),ymin+k);
    end
else % horizontal distance is more
    for k=1:maxDist-1
        VerticalIndex = [floor(k*distVertical/distHorizontal) ceil(k*distVertical/distHorizontal)]+ymin;
        line(2*k-1) = Map(VerticalIndex(1),xmin+k);
        line(2*k) = Map(VerticalIndex(2),xmin+k);
    end
end

if sum(line) == 0
    % Free path
    FreePath = 1;
else
    FreePath = 0;
end

Distance = dist(distHorizontal, distVertical);

