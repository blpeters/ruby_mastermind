# frozen_string_literal: true

# require_relative 'game'
# require_relative 'logic'
# require_relative 'codebreaker'
require_relative 'instructions'

# Starts and ends the game, including replays
class Game
  attr_accessor :game_over

  include Instructions

  def initialize
    @game_over = false
    puts instructions
    start_game
  end

  def start_game
    # Assumes human will play role of breaker for now but
    # may need to add functionality for computer AI
    game_logic = Logic.new
  end

  def end_game(condition)
    game_over = true
    condition == 1 ? "you win" : "you lose"
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
end

# Proceeds through the game logic by handling guesses/results
# Messages received: What is your answer?
# Messages sent: This is how correct your answer is
class Logic
  attr_reader :secret_code, :breaker
  attr_accessor :turns, :game_over

  def initialize
    @game_over = false
    # The secret code could be obtained from creating a new instance of a
    # Codemaker class that has a human or computer make a code and send it back
    @secret_code = '1234'
    @turns = 0
    play
  end

  def play
    @breaker = Codebreaker.new
    until game_over
      get_guess
    end
  end

  def get_guess
    check_guess(breaker.guess)
  end

  def check_guess(guess_attempt)
    # turns += 1 #doesn't work
    if code_broken?(guess_attempt)
      end_game
      true
    elsif turns == 13
      end_game
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
  attr_reader :turns

  def guess
    guess_attempt = ''
    until validate_guess(guess_attempt)
      print "Enter guess ##{@turns} by entering 4 consecutive numbers(no spaces): "
      guess_attempt = gets.chomp.to_s
    end
    guess_attempt
  end

  def validate_guess(input)
    # regex match for only a 4-digit input with digits between 1 and 6.
    input.match(/^[1-6]{4}$/) ? true : false
  end

end

Game.new