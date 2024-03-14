function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n+1, 1);
  FeatureMatrix = [ones(m, 1), FeatureMatrix];
  for i = 1:iter
      hypothesis = FeatureMatrix * Theta;
      diff = hypothesis - Y;
      gradient = (1/m) * (FeatureMatrix' * diff);
      Theta = Theta - alpha * gradient;
  endfor
  Theta(1) = 0;
endfunction

