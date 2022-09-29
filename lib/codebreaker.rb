# # frozen_string_literal: true

# require_relative 'game'
# require_relative 'logic'

# # Codebreaker class - using human input or computer AI, takes guesses at code.
# class Codebreaker
#   attr_reader :turns

#   def guess
#     guess_attempt = ''
#     until validate_guess(guess_attempt)
#       print "Enter guess ##{@turns} by entering 4 consecutive numbers(no spaces): "
#       guess_attempt = gets.chomp.to_s
#     end
#     guess_attempt
#   end

#   def validate_guess(input)
#     # regex match for only a 4-digit input with digits between 1 and 6.
#     input.match(/^[1-6]{4}$/) ? true : false
#   end

# end
