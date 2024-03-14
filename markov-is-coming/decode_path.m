function [decoded_path] = decode_path (path, lines, cols)
  decoded_path = [];
  for i=1:length(path) - 1
    x = path(i);
    linie = 1;
    while x > cols
      x = x - cols;
      linie = linie + 1;
    endwhile
    decoded_path = vertcat(decoded_path, [linie x]);
  endfor
endfunction
