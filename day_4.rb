#!/usr/bin/env ruby

require_relative './lib/base_day'

class Day4 < BaseDay
  def initialize
    @pass_phrases = read_lines_from('input/day_4.txt')
  end

  def part_1_solution
    @pass_phrases.select do |pass_phrase|
      valid?(pass_phrase)
    end.size
  end

  def part_2_solution
    @pass_phrases.select do |pass_phrase|
      valid?(pass_phrase, check_anagram: true)
    end.size
  end

  private

  def valid?(pass_phrase, check_anagram: false)
    words = pass_phrase.split(' ')

    occurences = words.each_with_object(Hash.new(0)) do |word, counts|
      key = check_anagram ? word.chars.sort.join : word
      counts[key] += 1
    end

    occurences.all? { |_, count| count == 1 }
  end
end

Day4.solve
