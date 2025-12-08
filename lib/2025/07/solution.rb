lines = input
  .each_slice(2).map(&:first)

splits = 0
beams = [lines.first.index('S')]

lines[1..].each do |line|
  new_beams = []

  beams.each do |beam|
    if line[beam] == '^'
      splits += 1

      new_beams.push(beam - 1)
      new_beams.push(beam + 1)
    else
      new_beams.push(beam)
    end
  end

  beams = new_beams.uniq
end

puts "Part I: #{splits}"

beams = {
  lines.first.index("S") => 1
}

lines[1..].each do |line|
  new_beams = Hash.new(0)

  beams.each do |beam, count|
    if line[beam] == '^'
      new_beams[beam - 1] += count
      new_beams[beam + 1] += count
    else
      new_beams[beam] += count
    end
  end

  beams = new_beams
end

puts "Part II: #{beams.values.sum}"
