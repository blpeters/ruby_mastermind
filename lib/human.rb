# frozen_string_literal: true

require_relative 'game'

# Human class
class Human
  attr_reader :turns, :guess

  def initialize
    @turns = 1
    @guess = []
  end

  def guess
    until @game_over
      guess_attempt = ''
      until validate_guess(guess_attempt)
        print "Enter guess ##{@turns} by entering 4 consecutive numbers(no spaces): "
        guess_attempt = gets.chomp.to_s
      end
      @turns += 1
      @guess = guess_attempt
      Game.check_guess(@guess, @turns)
    end
  end

  def validate_guess(input)
    # regex match for only a 4-digit input with digits between 1 and 6.
    input.match(/^[1-6]{4}$/) ? true : false
  end
end
