function dX = transformMovement(dr, dt, X)

dX = [dr*cos(X(3));
      dr*sin(X(3));
      dt];