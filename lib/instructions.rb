# frozen_string_literal: true

# Text instructions for playing the Mastermind game.
# For now,write instructions for the human to guess a computer generated
# solution only. Add a computer-guessing version later
module Instructions
  def instructions
    <<~HEREDOC

      Welcome to Mastermind!

      You are tasked with cracking the 4-color code that the computer will be creating from the following list:

        1 - Red (R)
        2 - Orange (O)
        3 - Yellow (Y)
        4 - Green (G)
        5 - Blue (B)
        6 - Violet (V)

        - Each color can be reused.
        - You will have 12 attempts to solve the code and win the game. For each attempt, you will create a
        4-color guess by inputting either the color (e.g. 'red'), the color shorthand code (e.g. 'R' for red),
        or the number shorthand for each color (e.g. '1' for red).
        - Once you have completed a guess, the computer will provide CLUES for how close your guess is to
        the solution. A hollow circle indicates that your code contains one of the correct colors, but
        in the wrong place. A solid circle indicates there is a correct color in the correct place.
        - Continue guessing until you win (4 solid circles) or the computer wins after 12 failed guesses.

        LET'S PLAY!

    HEREDOC
  end
end
