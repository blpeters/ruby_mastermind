# frozen_string_literal: true

require_relative 'instructions'
require_relative 'human'

# Handles gameplay procedures
class Game
  attr_reader :game_over

  include Instructions

  def initialize
    @game_over = false
    @@secret_code = '1234'
    play
  end

  def play
    puts instructions
    # Make a new human class object
    player = Human.new
    player.guess
  end

  def self.check_guess(guess, turns)
    if code_broken?(guess)
      @game_over = true
      puts 'You cracked the code! You win!'
      reset_game
    elsif turns == 13
      @game_over = true
      puts 'Game Over - You ran out of turns.'
      reset_game
    else return false
    end
  end

  def self.code_broken?(guess)
    guess == @@secret_code
  end

  def self.reset_game
    puts "Do You want to play again? (y/n)"
    answer = gets.chomp.upcase
    play_again = case answer
    when 'Y' then Game.new
    when 'N' 
      puts "BYE"
      exit
    end
  end
end
