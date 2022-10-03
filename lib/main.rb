# frozen_string_literal: true

# require_relative 'game'
# require_relative 'logic'
# require_relative 'codebreaker'
require_relative 'instructions'

# Starts and ends the game, including replays
class Game
  attr_reader :secret_code
  attr_accessor :game_over, :breaker, :turns

  include Instructions

  def initialize
    @game_over = false
    @secret_code = '1234' # Placeholder - will need a codemaker class.
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
    condition == 1 ? (puts 'You win!!') : (puts 'You ran out of turns')
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
    else false
    end
  end

  def code_broken?(guess)
    guess == secret_code
  end
end

# Codebreaker class - using human input or computer AI, takes guesses at code.
class Codebreaker
  def guess
    guess_attempt = ''
    until validate_guess(guess_attempt)
      print 'Enter guess by entering 4 consecutive numbers(no spaces): '
      guess_attempt = gets.chomp.to_s
    end
    guess_attempt
  end

  private

  def validate_guess(input)
    # regex match for only a 4-digit input with digits between 1 and 6.
    input.match(/^[1-6]{4}$/) ? true : false
  end
end

game = Game.new