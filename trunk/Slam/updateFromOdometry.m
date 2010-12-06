function [X, P] = updateFromOdometry(X, dX, P, CC)

%X(1:3) = X(1:3) + dX;       %Update position from estimated dX
for i=1:3
    X(i) = X(i) + dX(i);
end

%Update covariance matrix
AA = [1 0 -dX(2);
     0 1 dX(1);
     0 0 1];

W = [cos(X(3)) 0;
     sin(X(3)) 0;
     0 1];

 %Bytte från detta, hoppas rätt...
%  W = [dX(1)/V(1) 0;
%      dX(2)/V(1) 0;
%      0 dX(3)/V(2)];

Q = W*CC*W';

Prr = P(1:3,1:3);
Pri = P(1:3,4:end);
Prr = AA*Prr*AA'+Q;
Pri = AA*Pri;

P(1:3,1:3) = Prr;
P(1:3,4:end) = Pri;
P(4:end,1:3) = Pri';