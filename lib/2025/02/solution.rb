# input = '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124'

input.first.scan(/(\d+)-(\d+)/).flat_map do |left, right|
  left.to_i.upto(right.to_i).select { /\A(\d+)\1\Z/ =~ it.to_s }
end.inject(&:+).tap { puts "Part I:  %s" % it }

input.first.scan(/(\d+)-(\d+)/).flat_map do |left, right|
  left.to_i.upto(right.to_i).select { /\A(\d+)\1+\Z/ =~ it.to_s }
end.inject(&:+).tap { puts "Part II: %s" % it }
