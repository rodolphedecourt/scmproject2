function [X, P] = addLandmark(newLandmark, X, dX, cr, cb, P)

%Add state
X(end+1) = newLandmark(1);
X(end+1) = newLandmark(2);
%X = [X ; newLandmark(1) ; newLandmark(2)];

%Add covariance
lx = newLandmark(1);
ly = newLandmark(2);
x = X(1);
y = X(2);
t = X(3);
r = sqrt( (lx-x)^2 + (ly-y)^2 );

Jxr = [1 0 -dX(2);
       0 1 dX(1)];

Jz = [cos(X(3)+dX(3)), ( -dX(2)*cos(dX(3)) -dX(1)*sin(dX(3)) );
      sin(X(3)+dX(3)), ( dX(1)*cos(dX(3)) - dX(2)*sin(dX(3)) )];

R = [cr*r 0;
     0 cb];

Prr = P(1:3,1:3);
Pri = P(4:end,1:3);

P_N1N1 = Jxr*Prr*Jxr' + Jz*R*Jz';

P_rN1 = Prr*Jxr';
P_N1r = P_rN1';

P_N1i = Jxr*Pri';
P_iN1 = P_N1i';

Pright = [P_rN1 ; P_iN1];
Pbottom = [P_N1r P_N1i P_N1N1];

P = [P Pright ; Pbottom];

