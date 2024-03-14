function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  x = x0;
  err = Inf;
  steps = 0;

  while (err > tol && steps < max_steps)
    x_old = x;
    x = G*x + c;
    err = norm(x - x_old, 2)
    steps = steps + 1;
  endwhile

  if (steps == max_steps && err > tol)
    return;
  endif
endfunction
