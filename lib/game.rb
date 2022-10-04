# frozen_string_literal: true

# require_relative 'instructions'
# require_relative 'codebreaker'
# require_relative 'codemaker'
# require_relative 'logic'

# # Starts and ends the game, including replays
# class Game
#   attr_accessor :name, :game_over

#   include Instructions

#   def initialize(name)
#     @name = name
#     @game_over = false
#     puts instructions
#     start_game
#   end

#   def start_game
#     # Assumes human will play role of breaker for now but
#     # may need to add functionality for computer AI
#     game_logic = Logic.new
#   end

#   def end_game(condition)
#     game_over = true
#     condition == 1 ? "you win" : "you lose"
#     replay
#   end

#   def replay
#     puts 'Do You want to play again? (y/n)'
#     answer = gets.chomp.upcase
#     play_again = case answer
#     when 'Y' then Game.new
#     when 'N' 
#       puts "BYE"
#       exit
#     end
#   end
# end