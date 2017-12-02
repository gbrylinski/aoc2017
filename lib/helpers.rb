module AOCHelpers
  def read_line_from(filename)
    File.readlines(filename).first.chomp
  end

  def show_solution(day, part, solution)
    puts "Solution for day #{day} part #{part} is between --- below:"
    puts "---"
    puts solution
    puts "---"
    puts
  end
end
