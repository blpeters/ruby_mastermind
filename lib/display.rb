# frozen_string_literal: true

require_relative 'string_colors'

module Display

  using StringColors

  def show_instructions
    puts <<~HEREDOC

      Welcome to Mastermind!

      In this game, the codebreaker is tasked with cracking the 4-color code that the codemaker creates from the following colors:

        #{'  1 - Red  '.background_color(:red)} #{'  2 - Orange  '.background_color(:orange)} #{'  3 - Yellow  '.background_color(:yellow)} #{'  4 - Green  '.background_color(:green)} #{'  5 - Blue  '.background_color(:blue)} #{'  6 - Violet  '.background_color(:violet)}

        - Each color can be reused.
        - The codebreaker have 12 attempts to solve the code and win the game. For each attempt, the codebreaker will input a
          4-digit code representing the colors of their guess.
        - Once the codebreaker provides a guess, the codemaker will provide the following clues in no particular order:

        **************************************************************************************************************
          \u25cc - Incorrect guess.  |   \u25cb - Correct color, but incorrect place  |   \u25cf - Correct color, correct place
        **************************************************************************************************************

        - The codebreaker continues guessing until they win (4 solid circles) or the codemaker wins after 12 failed guesses.

        LET'S PLAY!

    HEREDOC
  end

  def display_guess(code)
    puts "\n"
    print 'CURRENT GUESS: '
    puts format_code(code)
  end

  def display_code(code)
    puts "\n------------------------------------------------------------------------"
    print 'THE SECRET CODE WAS: '
    puts format_code(code)
    puts "------------------------------------------------------------------------\n\n"
  end

  def display_clues(arr)
    print "CLUES: "
    arr.each { |clue|
      case clue
      when 'C' then print "\u25cf "
      when 'P' then print "\u25cb "
      else print "error - clue doesn't exist "
      end
    }
    puts "\n\n"
  end 

  def win
    puts "\nCODE CRACKED!!!\n\n*************YOU WON*************"
  end

  private

  def format_code(code)
    code_arr = code.split('')
    code_arr.each {|num| color_code(num)}
    print ' '
  end

  def color_code(num)
    case num
    when '1' then print '  1 - Red  '.background_color(:red)
    when '2' then print '  2 - Orange  '.background_color(:orange)
    when '3' then print '  3 - Yellow  '.background_color(:yellow)
    when '4' then print '  4 - Green  '.background_color(:green)
    when '5' then print '  5 - Blue  '.background_color(:blue)
    when '6' then print '  6 - Violet  '.background_color(:violet)
    end
  end
end