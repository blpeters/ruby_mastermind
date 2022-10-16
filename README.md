# Mastermind

This is a Ruby-based version of the 2-player logic game, Mastermind.
This project was completed as part of [The Odin Project]'https://www.theodinproject.com/' curriculum.
It's played directly in the console using numerical values to represent colors.

[Live Preview]'https://replit.com/@blpeters/RubyMastermind' 

The game is played with one player as the code-maker and the other as a
code-breaker. The goal of the code-breaker is to determine within 12 turns
the 4-color secret code established by the code-maker. After each guess,
clues are provided telling the code-breaker how close they are to the correct code.

## Things to Improve
- I would like to add an option to have the computer play as the codebreaker.
I have started on refactoring for this, however, I am running into some
roadblocks mainly due to messaging between my objects. I need to refactor
the OOP components and classes within the code to create better messaging
and abstractions.