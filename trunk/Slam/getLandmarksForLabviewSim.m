function [measurements, noMeasurements, landmarks, totalNumberLandmarks, visionRange, visionAngle, Xreal, measRangeVar, measAngleVar]...
    = getLandmarksForLabviewSim(X, maxNumberLandmarks, landmarks, totalNumberLandmarks, visionRange, visionAngle, Xreal, measRangeVar, measAngleVar)


%measurements = zeros(maxNumberLandmarks,2);
noMeasurements = 0;

%For simulation
for i=1:totalNumberLandmarks
    if(findLandmark(landmarks(i,:), Xreal(1), Xreal(2), Xreal(3), visionRange, visionAngle)) %Find it if within vision range
        noMeasurements = noMeasurements + 1;
        [r t] = findRangeBearing(landmarks(i,1), landmarks(i,2), Xreal);
        r = r*( 1 + 2*measRangeVar*(rand-0.5) );                                                           %Measurement error
        t = t*( 1 + 2*measAngleVar*(rand-0.5) );
        measurements(noMeasurements,:) = [r,t];
    end
end

if(noMeasurements == 0)
    measurements = [];
end

% %This function is only for simulation. Should get measurements from image
% %analysis functions


%-----

% currentLandmarks = zeros(maxNumberLandmarks,2);
% noCurrentLandmarks = 0;
% 
% %For simulation
% for i=1:totalNumberLandmarks
%     if(findLandmark(landmarks(i,:), Xreal(1), Xreal(2), Xreal(3), visionRange, visionAngle)) %Find it if within vision range
%         noCurrentLandmarks = noCurrentLandmarks + 1;
%         [r t] = findRangeBearing(landmarks(i,1), landmarks(i,2), Xreal);
%         r = r*( 1 + 2*measRangeVar*(rand-0.5) );                                                           %Measurement error
%         t = t*( 1 + 2*measAngleVar*(rand-0.5) );
%         currentLandmarks(noCurrentLandmarks,:) = [X(1) + r*cos(X(3)+t), X(2) + r*sin(X(3)+t)];
%     end
% end
% 
% %This function is only for simulation. Should get landmarks from image
% %analysis functions