#!/usr/bin/env ruby

require_relative './lib/base_day'
require 'pry'

class Day2 < BaseDay
  def initialize
    @lines = read_lines_from('input/day_2.txt')
  end

  def part_1_solution
    array.inject(0) do |sum, row|
      sum + row.max - row.min
    end
  end

  def part_2_solution
    array.inject(0) do |sum, row|
      sorted = row.sort.reverse!
      division = even_divisor_for(sorted[0], sorted[1..-1])
      sum + division
    end
  end

  private

  def array
    @array ||= @lines.map do |row|
      row.split("\t").map(&:to_i)
    end
  end

  def even_divisor_for(number, divisors)
    if divisor = divisors.find { |d| number % d == 0 }
      number / divisor
    else
      even_divisor_for(divisors[0], divisors[1..-1])
    end
  end
end

Day2.solve
