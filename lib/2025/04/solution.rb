INPUT = input.map { it.chars }

def neighbours(x, y)
  [
    [x - 1, y - 1],
    [x, y - 1],
    [x + 1, y - 1],
    [x + 1, y],
    [x + 1, y + 1],
    [x, y + 1],
    [x - 1, y + 1],
    [x - 1, y]
  ].filter { |pair| pair.none?(&:negative?) && INPUT.dig(*pair) == '@' }.count
end

INPUT
  .each_with_index.filter_map do |row, x|
    row.each_with_index.filter_map do |item, y|
      [x,y] if item == '@' && neighbours(x, y) < 4
    end
  end

INPUT
  .each_with_index.map do |row, x|
    row.each_with_index.map do |item, y|
      next if item != '@'

      neighbours(x, y) < 4
    end
  end
    .flatten
    .count { it == true }
    .tap { puts "Part I: %d" % it }

def iterate
  to_remove = INPUT.each.with_object([]).with_index do |(array, qualified_array), y|
    array.each.with_index do |element, x|
      qualified_array << [y, x] if element == '@' && neighbours(y, x) < 4
    end
  end

  return INPUT if to_remove.empty?

  to_remove.each { INPUT[it.first][it.last] = 'R' }

  iterate
end

iterate.flatten.count { it == 'R' }.tap { print "Part II: %d" % it }
