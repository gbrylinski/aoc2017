#!/usr/bin/env ruby

require_relative './lib/base_day'

class Day3 < BaseDay
  def initialize
    @number = read_line_from('input/day_3.txt').to_i
    @x = -1
    @y = @min_x = @min_y = @max_x = @max_y = @sum = 0
    @dir = :right
    @sums = {}.tap { |x| x[[0, 0]] = 1 }
  end

  def part_1_solution
    go!
    @x.abs + @y.abs
  end

  def part_2_solution
    go!
    @sum
  end

  private

  def go!
    return if @go

    @number.times do |step|
      case @dir
      when :right
        @x += 1
        if @x > @max_x
          @max_x = @x
          @dir = :up
        end
      when :up
        @y += 1
        if @y > @max_y
          @max_y = @y
          @dir = :left
        end
      when :left
        @x -= 1
        if @x < @min_x
          @min_x = @x
          @dir = :down
        end
      when :down
        @y -= 1
        if @y < @min_y
          @min_y = @y
          @dir = :right
        end
      end
      next unless @sum.zero?
      sum_up_neighbours
      @sum = @sums[[@x, @y]] if @sums[[@x, @y]] > @number
    end
    @go = true
  end

  def sum_up_neighbours
    points = (@x-1 .. @x+1).flat_map do |x|
      (@y-1 .. @y+1).map do |y|
        @sums[[x, y]]
      end
    end
    @sums[[@x, @y]] = points.compact.reduce(0, &:+)
  end
end

Day3.solve
