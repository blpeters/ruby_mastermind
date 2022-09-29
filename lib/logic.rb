# # frozen_string_literal: true

# require_relative 'codebreaker'
# require_relative 'game'

# # Proceeds through the game logic by handling guesses/results
# # Messages received: What is your answer?
# # Messages sent: This is how correct your answer is
# class Logic
#   attr_reader :secret_code, :breaker
#   attr_accessor :turns, :game_over

#   def initialize
#     @game_over = false
#     # The secret code could be obtained from creating a new instance of a
#     # Codemaker class that has a human or computer make a code and send it back
#     @secret_code = '1234'
#     @turns = 0
#     play
#   end

#   def play
#     @breaker = Codebreaker.new
#     until game_over
#       get_guess
#     end
#   end

#   def get_guess
#     check_guess(breaker.guess)
#   end

#   def check_guess(guess_attempt)
#     # turns += 1 #doesn't work
#     if code_broken?(guess_attempt)
#       end_game
#       true
#     elsif turns == 13
#       end_game
#       true
#     else false
#     end
#   end

#   def code_broken?(guess)
#     guess == secret_code
#   end
# end
