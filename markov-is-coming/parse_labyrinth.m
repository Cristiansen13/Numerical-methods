function [Labyrinth] = parse_labyrinth(file_path)

  fileID = fopen(file_path, 'r');
  dimensions = fscanf(fileID, '%d', [1 2]);
  rows = dimensions(1);
  cols = dimensions(2);
  Labyrinth = zeros(rows, cols);
  for i = 1:rows
    row = fscanf(fileID, '%d', [1 cols]);
    Labyrinth(i, :) = row;
  endfor
  fclose(fileID);
endfunction

