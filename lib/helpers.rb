module AOCHelpers
  def read_line_from(filename)
    read_lines_from(filename).first
  end

  def read_lines_from(filename)
    File
      .readlines(filename)
      .map(&:chomp)
      .reject(&:empty?)
  end

  def show_solution(day, part, solution)
    puts "Solution for day #{day} part #{part} is between --- below:"
    puts "---"
    puts solution
    puts "---"
    puts
  end
end
