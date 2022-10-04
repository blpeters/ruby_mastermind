# frozen_string_literal: true

# require_relative 'game'
# require_relative 'logic'
require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'instructions'

# Starts and ends the game, including replays
class Game
  attr_reader :maker
  attr_accessor :game_over, :breaker, :turns

  include Instructions

  def initialize
    @game_over = false
    @maker = Codemaker.new
    puts instructions
    play
  end

  def play
    @breaker = Codebreaker.new
    @turns = 1
    until game_over
      get_guess
      @turns += 1
    end
  end

  def end_game(condition)
    game_over = true
    if condition == 1
      puts 'You win!!'
      puts "The secret code was:  #{maker.end_game}"
    else
      puts 'You ran out of turns'
    end
    replay
  end

  def replay
    puts 'Do You want to play again? (y/n)'
    answer = gets.chomp.upcase
    play_again = case answer
    when 'Y' then Game.new
    when 'N' 
      puts "BYE"
      exit
    end
  end
 
  def get_guess
    check_guess(breaker.guess)
  end

  def check_guess(guess_attempt)
    p turns
    if code_broken?(guess_attempt)
      end_game(1)
      true
    elsif turns == 12
      end_game(0)
      true
    else 
      p maker.get_clues(guess_attempt)
      false
    end
  end

  def code_broken?(guess)
    guess == maker.code
  end
end

game = Game.new

