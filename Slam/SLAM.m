function [Xout, P, Xodometry, measuredLandmarks] = SLAM(X, P, dX, measurements)

%% Init constants

%Init landmarks                     *** FOR REAL CODE ***
maxNumberLandmarks = 50;
foundLandmarks = zeros(maxNumberLandmarks,2);
noFoundLandmarks = 0;
landmarkDistance = 0.5;            %Radius of circular area where new landmark is considered to be the same as the old one

%Odometry errors                     *** FOR REAL CODE ***
CC = [0.1 0;
      0 0.1];

%Measurement error (camera)           *** FOR REAL CODE ***
cr = 0.1;
cb = pi/180*5;



%% Update current state from odometry

%Update state, real position and covariance                 *** FOR REAL CODE ***
[X, P] = updateFromOdometry(X, dX, P, CC);

Xodometry = X;


%% Estimate and associate landmarks
for i=1:(length(X)-3)/2
    foundLandmarks(i,1) = X(3+2*i-1);
    foundLandmarks(i,2) = X(3+2*i);
end
if(length(X) == 3)
    noFoundLandmarks = 0;
else
    noFoundLandmarks = i;
end

temp = size(measurements);
noMeasurements = temp(1);

[currentLandmarks, reObservedLandmarksRaB, newLandmarks, associatedLandmarks, noNewLandmarks, noReObservedLandmarks] = ...
assOrAddLandmark(X, measurements, noMeasurements, foundLandmarks, noFoundLandmarks, maxNumberLandmarks, landmarkDistance);

measuredLandmarks = currentLandmarks;


%% Update state from re-observed landmarks
for i=1:noReObservedLandmarks

    [X, P] = updateFromLandmarks(X, P, reObservedLandmarksRaB(i,:), associatedLandmarks(i), cr, cb);

end


%% Add new landmarks to the current state
for i=1:noNewLandmarks

    [X, P] = addLandmark(newLandmarks(i,:), X, dX, cr, cb, P);

end

Xout = X;
