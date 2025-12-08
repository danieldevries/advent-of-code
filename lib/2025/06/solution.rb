#input_raw = <<~HEREDOC
#123 328  51 64 
# 45 64  387 23 
#  6 98  215 314
#*   +   *   +  
#HEREDOC

input = input_raw.chomp.split("\n").map(&:split)
row_count = input.count

input.first.count.times.map do |i|
  column = row_count.times.map { |x| input[x][i] }
  operator = column.pop
  column.map(&:to_i).inject(operator.to_sym)
end.tap { puts "Part I: %s" % it.sum }

find_blank_row = ->(grid) { grid.find_index { |row| row.all? { |c| c =~ /\s/ } } }

input_raw
  .chomp
  .split("\n")
  .map { it.chars }
  .transpose.transpose.transpose
  .then do |grid|
    blank_row_index = find_blank_row.call(grid)
    chunks = []

    while blank_row_index
      chunk = grid.shift(blank_row_index)
      grid.shift
      chunks << chunk
      blank_row_index = find_blank_row.call(grid)
    end

    chunks << grid
    chunks
  end
    .map do |chunk|
      chunk_width = chunk[0].size
      chunk_operator = chunk[0][chunk_width - 1]

      chunk.map { it[..(chunk_width-1)].join.to_i }.inject(chunk_operator)
    end.tap { puts "Part II: %d" % it.sum }

