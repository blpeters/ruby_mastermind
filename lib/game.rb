# frozen_string_literal: true

require_relative 'instructions'

# Handles gameplay procedures
class Game
  include Instructions

  def play
    puts instructions
    #Make a new human class object
  end

end
