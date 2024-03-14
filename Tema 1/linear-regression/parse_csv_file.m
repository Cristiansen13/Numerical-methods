function [Y, InitialMatrix] = parse_csv_file(file_path)
  file_contents = textread(file_path, '%s', 'delimiter', '\n');
  headers = strsplit(file_contents{1}, ',');
  num_cols = length(headers);
  num_rows = length(file_contents) - 1;
  InitialMatrix = cell(num_rows, num_cols);
  Y = zeros(num_rows, 1);
  for i = 2:length(file_contents)
      row_cells = strsplit(file_contents{i}, ',');
      for j = 2:num_cols
          if all(isstrprop(row_cells{j}, 'digit') | row_cells{j} == '.' | row_cells{j} == '-')
              InitialMatrix{i-1,j} = str2double(row_cells{j});
          else
              InitialMatrix{i-1,j} = row_cells{j};
          endif
      endfor
      Y(i-1) = str2double(row_cells{1});
  endfor
endfunction

