function [Adj] = get_adjacency_matrix (Labyrinth)
  [rows, cols] = size(Labyrinth);
  num_nodes = rows*cols + 2;
  Adj = zeros(num_nodes);
  for i = 1:rows
    for j = 1:cols
      node = (i-1)*cols + j;
      if bitand(Labyrinth(i,j), 1) == 0 && j > 1
        left_node = node - 1;
        Adj(node, left_node) = 1;
        Adj(left_node, node) = 1;
      endif

      if bitand(Labyrinth(i,j), 8) == 0 && i > 1
        top_node = (i-2)*cols + j;
        Adj(node, top_node) = 1;
        Adj(top_node, node) = 1;
      endif

      if bitand(Labyrinth(i,j), 2) == 0 && j < cols
        right_node = node + 1;
        Adj(node, right_node) = 1;
        Adj(right_node, node) = 1;
      endif

      if bitand(Labyrinth(i,j), 4) == 0 && i < rows
        bottom_node = i*cols + j;
        Adj(node, bottom_node) = 1;
        Adj(bottom_node, node) = 1;
      endif
      if i == 1 && ~bitand(Labyrinth(i,j), 8)
        Adj(node, num_nodes-1) = 1;
      endif
      if i == rows && ~bitand(Labyrinth(i,j), 4)
        Adj(node, num_nodes-1) = 1;
      endif
      if j == 1 && ~bitand(Labyrinth(i,j), 1)
        Adj(node, num_nodes) = 1;
      endif
      if j == cols && ~bitand(Labyrinth(i,j), 2)
          Adj(node, num_nodes) = 1;
      endif
    endfor
  endfor
  Adj(num_nodes, num_nodes) = 1;
  Adj(num_nodes - 1, num_nodes - 1) = 1;
  Adj = sparse(Adj);
endfunction
