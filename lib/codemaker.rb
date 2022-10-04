# Codemaker class - Either has a human or computer select provide clues about secret code
class Codemaker
  attr_reader :code
  #TODO: add human selection option
  def initialize
    @code = '3453' # generate_code
  end

  def clues(guess)
    p get_black_pegs(guess)
  end

  def get_black_pegs(guess)
    secret_code_arr = code.split('')
    secret_code_arr.each_with_index {|color, index|
      secret_code_arr[index] = 'C' if color == guess[index] # C stands for correct guess
    }
  end

  private

  def generate_code
    code_array = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    p code_array.join('')
  end
end
maker = Codemaker.new
maker.clues('1151')
