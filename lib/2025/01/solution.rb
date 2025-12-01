# input = %w[L68 L30 R48 L5 R60 L55 L1 L99 R14 L82]

current_position = 50
part_1 = 0
part_2 = 0

input.map do |instruction|
  instruction = (instruction[0] == 'L' ? -1 : 1) * instruction[1..].to_i

  quotient, remainder = instruction.abs.divmod(100)
  negated = remainder * (instruction / instruction.abs)

  next_position = current_position + negated

  part_2 += quotient
  part_2 += 1 if remainder != 0 && current_position != 0 && (next_position <= 0 || next_position >= 100)

  current_position = next_position % 100

  part_1 += 1 if current_position == 0
end

puts "Part I: #{part_1}"
puts "Part II: #{part_2}"
puts

current_position = 50

input
  .map do |instruction|
    direction, moves = instruction[0], instruction[1..].to_i

    case direction
    when 'L'
      moves.times.map do
        current_position -= 1
        current_position = 99 if current_position < 0
        current_position
      end
    when 'R'
      moves.times.map do
        current_position += 1
        current_position = 0 if current_position > 99
        current_position
      end
    end
  end
    .tap do |results|
      puts "Part I:  #{results.count { it.last == 0 }}"
      puts "Part II: #{results.flatten.count { it == 0 }}"
    end
