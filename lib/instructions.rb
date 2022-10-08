# frozen_string_literal: true

require_relative 'string_colors'

# Text instructions for playing the Mastermind game.
# For now,write instructions for the human to guess a computer generated
# solution only. Add a computer-guessing version later
module Instructions
  
  using StringColors

  def instructions
    <<~HEREDOC

      Welcome to Mastermind!

      You are tasked with cracking the 4-color code that the computer will be creating from the following list:

        #{'  1 - Red  '.background_color(:red)} #{'  2 - Orange  '.background_color(:orange)} #{'  3 - Yellow  '.background_color(:yellow)} #{'  4 - Green  '.background_color(:green)} #{'  5 - Blue  '.background_color(:blue)} #{'  6 - Violet  '.background_color(:violet)}

        - Each color can be reused.
        - You will have 12 attempts to solve the code and win the game. For each attempt, you will input a
        4-digit code representing the colors of your guess.
        - Once you have completed a guess, the computer will provide CLUES for how close your guess is to
        the solution. A hollow circle indicates that your code contains one of the correct colors, but
        in the wrong place. A solid circle indicates there is a correct color in the correct place.
        - Continue guessing until you win (4 solid circles) or the computer wins after 12 failed guesses.

        LET'S PLAY!

    HEREDOC
  end
end
