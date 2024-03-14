function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path);
  dimensions = str2double(strsplit(fgetl(fid)));
  m = dimensions(1);
  n = dimensions(2);
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);
  for i=1:m
    row = strsplit(fgetl(fid));
    Y(i) = str2double(row{1});
    for j = 2:n+1
        element_str = row{j};
        if ~isnan(str2double(element_str))
            element = str2double(element_str);
        else
            element = element_str;
        endif
        InitialMatrix{i,j} = element;
    endfor
  endfor
  InitialMatrix
  fclose(fid);
endfunction

