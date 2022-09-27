# frozen_string_literal: true

require_relative 'game'
require_relative 'main'

# Human class
class Human
  attr_reader :turns, :guess

  def initialize
    @turns = 0
    @guess = []
    Game.new
  end

  def guess
    until @game_over
      puts @turns
      guess_attempt = ''
      until validate_guess(guess_attempt)
        print 'Enter your guess by entering 4 consecutive numbers(no spaces): '
        guess_attempt = gets.chomp.to_s
      end
      @turns += 1
      @guess = guess_attempt
      check_guess(@guess)
    end
  end

  def validate_guess(input)
    # regex match for only a 4-digit input with digits between 1 and 6.
    input.match(/^[1-6]{4}$/) ? true : false
  end
end
