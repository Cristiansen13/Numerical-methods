function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  dim = size(InitialMatrix);
  m = dim(1);
  n = dim(2);
  FeatureMatrix = zeros(m, n);
  lin = 1;
  for i=1:m
    col = 1;
    for j=2:n
      if isnumeric(InitialMatrix{i, j})
        FeatureMatrix(lin, col) = InitialMatrix{i, j};
        col = col + 1;
      endif
      if strcmp(InitialMatrix(i,j), "yes")
        FeatureMatrix(lin, col) = 1;
        col = col + 1;
      endif
      if strcmp(InitialMatrix(i,j), "no")
        FeatureMatrix(lin, col) = 0;
        col = col + 1;
      endif
      if strcmp(InitialMatrix(i,j), "unfurnished")
        FeatureMatrix(lin, col) = 0;
        FeatureMatrix(lin, col + 1) = 1;
        col = col + 2;
      endif
      if strcmp(InitialMatrix(i,j), "furnished")
        FeatureMatrix(lin, col) = 0;
        FeatureMatrix(lin, col + 1) = 0;
        col = col + 2;
      endif
      if strcmp(InitialMatrix(i,j), "semi-furnished")
        FeatureMatrix(lin, col) = 1;
        FeatureMatrix(lin, col + 1) = 0;
        col = col + 2;
      endif
    endfor
    lin = lin + 1;
  endfor

endfunction

