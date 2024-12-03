input.map do |line|
  line.scan(/mul\((\d+),(\d+)\)/).map do |match|
    match.map(&:to_i).inject(:*)
  end
end.flatten.sum.tap { puts "Part 1: %s" % _1 }

enabled = true
input.map do |line|
  line.scan(/(don\'t|do)\(\)|mul\((\d+),(\d+)\)/).map do |match|
    enabled = match[0] == 'do' if match[0]
    match[1..2].map(&:to_i).inject(:*) if enabled && match[1..2].none?(&:nil?)
  end.compact
end.flatten.sum.tap { puts "Part 2: %s" % _1 }