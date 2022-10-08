# frozen_string_literal: true

require_relative 'display'

# Codemaker class - Either has a human or computer select provide clues about secret code
class Codemaker
  attr_reader :code

  include Display

  def initialize
    @code = generate_code
  end

  # check out batmangoo's solution
  def get_clues(guess)
    black_pegs_result = get_black_pegs(guess)
    clues_result = get_white_pegs(black_pegs_result)
    clues_result.delete('X')
    clues_result.sort
  end

  def end_game
    reveal_code
  end

  private

  def generate_code
    code_array = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    code_array.join('')
  end

  # Determine absolutely correct (C) colors
  def get_black_pegs(guess)
    black_peg_arr = guess.split('')
    code_arr = code.split('')
    black_peg_arr.each_with_index { |color, index|
      if color == code_arr[index]
        black_peg_arr[index] = 'C'
        code_arr[index] = 'C'
      end
      }
    [code_arr, black_peg_arr]
  end

  # Determine Partially correct (P) colors
  def get_white_pegs(arr)
    code_arr = arr[0]
    clues_arr = arr[1]
    clues_arr.each_with_index { |color, index|
      if color =~ /[1-6]/ && code_arr.include?(color)
        code_arr[code_arr.find_index(color)] = 'P'
        clues_arr[index] = 'P'
      elsif !code_arr.include?(color)
        clues_arr[index] = 'X'
      end
    }
    clues_arr
  end

  def reveal_code
    display_code(@code)
  end
end
