function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = size(FeatureMatrix, 1);
  Theta = Theta(2:end);
  predictions = FeatureMatrix * Theta;
  sqErrors = predictions - Y;
  sqErrors_trans = transpose(sqErrors);
  sqErrors = sqErrors_trans * sqErrors;
  Error = sqErrors(1, 1) / m;
  Error = Error + lambda * (norm(Theta, 1));
endfunction
