X=[0;0;0];
P=[0.01 0 0;0 0.01 0;0 0 0.01];
dX=[0.1;0.1;-0.003];
measurements=[0.89 -0.18];
[Xout, Pout, Xodometry, measuredLandmarks] = SLAM(X, P, dX, measurements);
Xout
Pout
Xodometry