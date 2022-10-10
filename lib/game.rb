# frozen_string_literal: true

require_relative 'string_colors'
require_relative 'display'

# Starts and ends the game, including replays
class Game
  attr_reader :maker, :breaker
  attr_accessor :game_over, :turns, :display
  
  using StringColors
  include Display

  def initialize
    @game_over = false
    show_instructions
    format = choose_format
    play(format)
  end

  def choose_format
    puts 'Please select if you would like to play as the Codemaker(1) or Codebreaker(2)'
    print 'Choose 1 for Codemaker or 2 for Codebreaker: '
    user_input = gets.chomp
    until user_input.match?(/[1,2]/)
      print "invalid input. Choose 1 or 2: "
      user_input = gets.chomp
    end
    user_input.to_i
  end

  def play(format)
    @maker = Codemaker.new(format)
    @breaker = Codebreaker.new(format)
    @turns = 1
    until game_over
      get_guess
      @turns += 1
    end
  end

  def end_game(condition)
    game_over = true
    if condition == 1
      win
      maker.end_game
    else
      puts 'You ran out of turns'
      maker.end_game
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
    @current_guess = breaker.guess
    display_guess(@current_guess)
    check_guess(@current_guess)
  end

  def check_guess(guess_attempt)
    if code_broken?(guess_attempt)
      end_game(1)
      true
    elsif turns == 12
      end_game(0)
      true
    else 
      display_clues(maker.get_clues(guess_attempt))
      # puts "\nClues: #{maker.get_clues(guess_attempt).join(' ')}\n\n"
      false
    end
  end

  def code_broken?(guess)
    guess == maker.code
  end
end