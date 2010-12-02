function [path Distance] = PathPlanning(Map,nodes)
% [path Distance] = PathPlanning(Map,nodes)
% 
% Calculates the shortest path between two nodes in a 2-dimensional map.
%
% Map is a matrix where all elements with 0 is free space.
% nodes is a cell array with the coordinates of all nodes. The coordinates
% is defined by nodes{n} = [xn:yn].
% It is the path between the first and the last node that will be
% optimized.
%
% path is an array with the order of the nodes for the optimal path.
% Distance is the total distance.


Edges = zeros(2,sum(1:length(nodes)-1));
Distances = zeros(1,sum(1:length(nodes)-1));
noEdges = 0;
RemainingNodes = nodes(2:end);
for k=1:length(nodes)
    for l=1:length(RemainingNodes)
        [FreePath, Distance] = createEdge(Map,nodes{k},RemainingNodes{l});
        if FreePath == 1
            noEdges = noEdges+1;
            Edges(1,noEdges) = k;
            Edges(2,noEdges) = k+l;
            Distances(noEdges) = Distance;
        end
    end
    RemainingNodes = RemainingNodes(2:end);
end
Edges = Edges(:,1:noEdges);
Distances = Distances(1:noEdges);
noEdges

DG = sparse([Edges(1,:) Edges(2,:)],[Edges(2,:) Edges(1,:)],[Distances Distances]);

[Distance,path,pred] = graphshortestpath(DG,1,length(nodes));
