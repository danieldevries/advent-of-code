lines = input.map { |line| line.split.map(&:to_i) }

calculate = ->(line) { line.each_cons(2).map { |a, b| a - b } }
is_safe = ->(line) { line.all? { |n| n.between?(-3, 3) } && (line.all?(&:positive?) || line.all?(&:negative?)) }

lines.map(&calculate)
     .count(&is_safe)
     .tap { puts "Part 1: %s" % _1 }

lines.count do |line|
  is_safe[calculate[line]] ||
    line.each_index
        .map { |index| calculate[line.dup.tap { _1.delete_at(index) }] }
        .any?(&is_safe)
end.tap { puts "Part 2: %s" % _1 }
