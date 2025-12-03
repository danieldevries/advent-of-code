# input = %w[987654321111111 811111111111119 234234234234278 818181911112111]

input
  .map { it.chars.map(&:to_i) }
  .map do
    a = it[...-1].max
    b = it[it.index(a) + 1..].max

    [a, b].join.to_i
  end
    .sum
    .tap { puts "Part I: #{it}" }

input
  .map { it.chars.map(&:to_i) }
  .map do |bank|
    first = 0
    -12.upto(-1).map do |last|
      digit = bank[first..last].max
      first += bank[first..].index(digit) + 1
      digit
    end.join.to_i
  end
    .sum
    .tap { puts "Part II: #{it}" }
