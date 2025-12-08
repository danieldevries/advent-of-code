class Runner
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def execute
    path = File.expand_path("./#{date}/solution.rb", File.dirname(__FILE__))
    eval(File.read(path), binding, path)
  end

  def input
    File.readlines("inputs/#{date}.txt", chomp: true)
  end

  def input_raw
    File.read("inputs/#{date}.txt", chomp: true)
  end
end
