function associatedFoundLandmark = associateToLandmark(currentLandmark, foundLandmarks, noFoundLandmarks)

associatedFoundLandmark = 0;     %init
minDistance = 100;

for i=1:noFoundLandmarks
    d = distance(currentLandmark, foundLandmarks(i,:));
    if(d < minDistance)
        minDistance = d;
        associatedFoundLandmark = i;
    end
end