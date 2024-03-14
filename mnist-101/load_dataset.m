function [X, y] = load_dataset(path)
  mat_contents = load(path);
  X = mat_contents.X;
  y = mat_contents.y;

endfunction
