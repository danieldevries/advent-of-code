numbers = input.map { |line| line.split.map(&:to_i) }
left = numbers.map(&:first)
right = numbers.map(&:last)

left.sort.zip(right.sort).sum do |(a,b)|
  (a - b).abs
end.tap { puts "Part 1: %s" % _1 }

left.sum do |n|
  n * right.count(n)
end.tap { puts "Part 2: %s" %  _1 }
