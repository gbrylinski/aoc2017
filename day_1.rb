#!/usr/bin/env ruby

require_relative './lib/base_day'

class Day1 < BaseDay
  def initialize
    @input = read_line_from('input/day_1.txt')
    @length = @input.length
  end

  def part_1_solution
    a_sum(1)
  end

  def part_2_solution
    a_sum(@length / 2)
  end

  private

  def a_sum(offset)
    (0..@length).inject(0) do |sum, idx|
      sum + (@input[idx] == @input[idx - offset] ? @input[idx].to_i : 0)
    end
  end
end

Day1.solve
