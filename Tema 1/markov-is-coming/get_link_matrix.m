function [Link] = get_link_matrix (Labyrinth)
  [rows, cols] = size(Labyrinth);
  num_nodes = rows*cols + 2;
  Link = get_adjacency_matrix(Labyrinth);
  for i = 1:num_nodes
    x = 0;
    for j = 1:num_nodes
      if Link(i, j) == 1
        x++
      endif
    endfor
    x = 1/x;
    for j = 1:num_nodes
      if Link(i, j) == 1
        Link(i,j) = x
      endif
    endfor
  endfor
endfunction
