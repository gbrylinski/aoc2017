require_relative './helpers'

class BaseDay
  include AOCHelpers

  def self.solve
    day = new
    day.show_part_1_solution
    day.show_part_2_solution
  end

  def part_1_solution
    raise "please resolve a part 1 first!"
  end

  def part_2_solution
    raise "please resolve a part 2 first!"
  end

  def show_part_1_solution
    show_solution(@day, 1, part_1_solution)
  end

  def show_part_2_solution
    show_solution(@day, 2, part_2_solution)
  end
end
