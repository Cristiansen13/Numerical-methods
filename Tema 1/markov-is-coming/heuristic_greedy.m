function [path] = heuristic_greedy (start_position, probabilities, Adj)
  [rows, cols] = size(Adj);
  path = [start_position];
  visited = [start_position];
  while probabilities(path(end)) != 1
    neigh = []
    for i = 1:rows
      if Adj(path(end), i) == 1
        neigh = [neigh, i];
      endif
    endfor
    new_neigh = [];
    for i = 1:length(neigh)
      x = 0;
      for j = 1:length(visited)
        if visited(j) == neigh(i)
          x = x + 1;
        endif
      endfor
      if x == 0
        new_neigh = [new_neigh, neigh(i)];
      endif
    endfor
    new = [];
    maxim = 0;
    for i=1:length(new_neigh)
      if probabilities(new_neigh(i)) > maxim
        maxim = probabilities(new_neigh(i));
        new = new_neigh(i);
      endif
    endfor
    if isempty(new)
      path(end) = [];
    else
      path = [path, new];
    endif
  endwhile
endfunction
