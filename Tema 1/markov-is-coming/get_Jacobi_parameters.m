function [G, c] = get_Jacobi_parameters (Link)
  [rows, cols] = size(Link);
  G = Link(1:rows-2, 1:cols-2);
  c = Link(1:rows-2,cols-1:cols-1)
endfunction
