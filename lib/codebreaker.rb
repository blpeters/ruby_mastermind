# frozen_string_literal: true

# Codebreaker class - using human input, takes guesses at code.
class Codebreaker
  attr_reader :format, :clues
  attr_accessor :choices

  def initialize(format)
    @format = format
    create_choices_arr if format == 1
  end
  
  def guess
    guess_attempt = ''
    case format
    when 1
      guess_attempt = computer_guess
    when 2
      until validate_guess(guess_attempt)
        print 'Enter guess by entering 4 consecutive numbers(no spaces): '
        guess_attempt = gets.chomp.to_s
      end
    end
    guess_attempt
  end

  def store_clues(clues)
    @clues = clues
  end

  def create_choices_arr
    @choices = []
    for i in 1111..6666
      temp = i.to_s
      unless temp.match?(/[0789]+/)
        choices << temp
      end
    end
  end

  private

  def validate_guess(input)
    # regex match for only a 4-digit input with digits between 1 and 6.
    input.match(/^[1-6]{4}$/) ? true : false
  end

  def computer_guess
    print "number of choices remaining: "
    p choices.length
    '1234'
  end
end
