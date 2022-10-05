# frozen_string_literal: true
# Starts and ends the game, including replays

require_relative 'instructions'

class Game
  attr_reader :maker, :breaker
  attr_accessor :game_over, :turns

  include Instructions

  def initialize
    @game_over = false
    puts instructions
    play
  end

  def play
    @maker = Codemaker.new
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
    p @current_guess = breaker.guess
    @current_guess = check_guess(@current_guess)
  end

  def check_guess(guess_attempt)
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