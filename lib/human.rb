# frozen_string_literal: true

# Human class
class Human
  def initialize
    @turns = 0
    @guess = []
    puts "human initialized"
  end

  def guess
    puts @turns
    print "Enter your guess for the first color: "
    guess_attempt = gets.chomp.to_s
    validate_guess(guess_attempt)
    return @guess
  end

  def validate_guess(input)
    # TODO: refactor to check for color string input or shorthand
    # string inputs, not just number representation.
    
  end
end

puts Human.new.guess
