function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m n] = size(FeatureMatrix);
  Y = FeatureMatrix' * Y;
  FeatureMatrix = FeatureMatrix' * FeatureMatrix;
  if isdefinite(FeatureMatrix) <= 0
    Theta = zeros(n + 1, 1);
    return;
  endif
  r = Y;
  v = r;
  Theta = zeros(n, 1);
  tolsquared = tol^2;
  k = 0;
  while k < iter && r'*r > tolsquared
    t = (r' * r) / (v' * FeatureMatrix * v);
    Theta = Theta + t * v;
    r_new = r;
    r = r - t * FeatureMatrix * v;
    s = (r' * r) / (r_new' * r_new );
    v = r + s * v;
    k = k + 1;
  endwhile
  Theta = Theta'
  Theta = [0, Theta]
  Theta = Theta'

endfunction
