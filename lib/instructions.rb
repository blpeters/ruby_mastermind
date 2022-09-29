# frozen_string_literal: true

# Text instructions for playing the Mastermind game.
# For now,write instructions for the human to guess a computer generated
# solution only. Add a computer-guessing version later
module Instructions
  def instructions
    <<~HEREDOC

      Welcome to Mastermind!

      You are tasked with cracking the 4-color code that the computer will be creating from the following list:

        1 - Red
        2 - Orange
        3 - Yellow
        4 - Green
        5 - Blue
        6 - Violet

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
