function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  indices = randperm(size(X, 1));
  split_idx = ceil(percent * size(X, 1));
  X_train = X(indices(1:split_idx), :);
  y_train = y(indices(1:split_idx), :);
  X_test = X(indices(split_idx+1:end), :);
  y_test = y(indices(split_idx+1:end), :);
endfunction
