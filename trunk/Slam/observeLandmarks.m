function [currentLandmarks, newLandmarks, reObservedLandmarks, noFoundLandmarks, noCurrentLandmarks, noNewLandmarks, noReObservedLandmarks] = ...
         observeLandmarks(X, measurements, noMeasurements, foundLandmarks, noFoundLandmarks, maxNumberLandmarks, landmarkDistance)

%Globals only for simulation
%global landmarks
%global totalNumberLandmarks
%global visionRange
%global visionAngle
%global Xreal
%global dXreal

%Init vectors
newLandmarks = zeros(maxNumberLandmarks ,2);
reObservedLandmarks = zeros(maxNumberLandmarks,3);
currentLandmarks = zeros(maxNumberLandmarks,2);
noReObservedLandmarks = 0;
noNewLandmarks = 0;
noCurrentLandmarks = 0;

for i=1:noMeasurements              %Find position of measured landmarks from odometry update
    currentLandmarks(i,:) = [X(1) + measurements(i,1)*cos(X(3)+measurements(i,2)), X(2) + measurements(i,1)*sin(X(3)+measurements(i,2))];
end
noCurrentLandmarks = noMeasurements;

for i=1:noCurrentLandmarks
    old = 0;
    if(noFoundLandmarks ~= 0)
        associatedFoundLandmark = associateToLandmark(currentLandmarks(i,:), foundLandmarks, noFoundLandmarks)
        if( dist( currentLandmarks(i,1) - foundLandmarks(associatedFoundLandmark,1) , currentLandmarks(i,2) - foundLandmarks(associatedFoundLandmark,2) ) < landmarkDistance )
            old = 1;
            noReObservedLandmarks = noReObservedLandmarks + 1;
            reObservedLandmarks(noReObservedLandmarks,1:2) = currentLandmarks(i,:);
            reObservedLandmarks(noReObservedLandmarks,3) = associatedFoundLandmark;
        end
    end
    if(old == 0)                                    %If not observed before, add to newLandmarks
        noFoundLandmarks = noFoundLandmarks + 1;
        noNewLandmarks = noNewLandmarks + 1;
        newLandmarks(noNewLandmarks,:) = currentLandmarks(i,:);
    end
end

%Only for printout
foundLandmarks;
newLandmarks;
currentLandmarks;
reObservedLandmarks
noFoundLandmarks;
noNewLandmarks;
noCurrentLandmarks;
noReObservedLandmarks