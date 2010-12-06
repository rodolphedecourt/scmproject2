function [Xout, Pout, Xodometry, measuredLandmarks, X11, X22, X33, X44, K, h, z, KK, XoutLand, lengthX, XoutDirect] = SLAM(X, P, dX, measurements)

XoutDirect = X;

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

X44 = X;


%% Update current state from odometry

%Update state, real position and covariance                 *** FOR REAL CODE ***
[XfromOdometry, PfromOdometry] = updateFromOdometry(X, dX, P, CC);

Xodometry = XfromOdometry;

%% Estimate and associate landmarks
for i=1:(length(XfromOdometry)-3)/2
    foundLandmarks(i,1) = X(3+2*i-1);
    foundLandmarks(i,2) = X(3+2*i);
end
if(length(XfromOdometry) == 3)
    noFoundLandmarks = 0;
else
    noFoundLandmarks = i;
end

temp = size(measurements);
noMeasurements = temp(1);

[currentLandmarks, reObservedLandmarksRaB, newLandmarks, associatedLandmarks, noNewLandmarks, noReObservedLandmarks] = ...
assOrAddLandmark(XfromOdometry, measurements, noMeasurements, foundLandmarks, noFoundLandmarks, maxNumberLandmarks, landmarkDistance);

measuredLandmarks = currentLandmarks;

measurements

X33 = XfromOdometry;

K = 1; %%%
h = 1;
z = 1;
KK = 1;
XoutLand = 1;
lengthX = 1;
Xo = 1;

%% Update state from re-observed landmarks
Xin1 = XfromOdometry;
Pin1 = PfromOdometry;
for i=1:noReObservedLandmarks

    [XupdateFromLandmarks1, PupdateFromLandmarks1, K, h, z, KK, Xo, lengthX] = updateFromLandmarks(Xin1, Pin1, reObservedLandmarksRaB(i,:), associatedLandmarks(i), cr, cb);
    Xin1 = XupdateFromLandmarks1;
    Pin1 = PupdateFromLandmarks1;
end

if(noReObservedLandmarks == 0)
    XupdateFromLandmarks1 = XfromOdometry;
    PupdateFromLandmarks1 = PfromOdometry;
end

temp = size(XupdateFromLandmarks1);                             %For labview compilation error...
if( temp(1) >= temp(2) )
    lengthXupdateFromLandmarks = temp(1);
else
    lengthXupdateFromLandmarks = temp(2);
end

XupdateFromLandmarks = zeros(lengthXupdateFromLandmarks,1);

for i=1:lengthXupdateFromLandmarks
    XupdateFromLandmarks(i) = XupdateFromLandmarks1(i);          %For labview compilation error...
end
PupdateFromLandmarks = PupdateFromLandmarks1;

XoutLand = Xo;
X11 = XupdateFromLandmarks;



%% Add new landmarks to the current state
Xin2 = XupdateFromLandmarks;
Pin2 = PupdateFromLandmarks;
for i=1:noNewLandmarks

    [XaddLandmarks1, PaddLandmarks1] = addLandmark(newLandmarks(i,:), Xin2, dX, cr, cb, Pin2);
    Xin2 = XaddLandmarks1;
    Pin2 = PaddLandmarks1;
end

if(noNewLandmarks == 0)
    XaddLandmarks1 = XupdateFromLandmarks;
    PaddLandmarks1 = PupdateFromLandmarks;
end

XaddLandmarks = XaddLandmarks1(:,1);                     %For labview compilation error...
PaddLandmarks = PaddLandmarks1;

X22 = XaddLandmarks; %%

Pout = PaddLandmarks;
Xout = XaddLandmarks;
