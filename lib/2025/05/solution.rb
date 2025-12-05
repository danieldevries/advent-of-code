input = '3-5
10-14
16-20
12-18

1
5
8
11
17
32'

input = File.read("inputs/#{date}.txt", chomp: true)

ranges, ids = input.split("\n\n")
ranges = ranges.lines.map { it.split("-").map(&:to_i) }
ids = ids.lines.map(&:to_i)

ids.filter_map do |id|
  ranges.find { |range| Range.new(*range).include?(id) }
end.tap { puts "Part I: %s" % it.count }

ranges
  .sort_by { [_1, _2] }
  .map { Range.new(*it) }
  .each_with_object([]) do |range, reduced|
    if !reduced.empty? && reduced.last.overlap?(range)
      reduced[-1] = Range.new(reduced.last.begin, [reduced.last.end, range.end].max)
    else
      reduced << range
    end
  end
    .map { _1.count }
    .tap { print "Part II: #{it.sum}" }
