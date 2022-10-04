# Codemaker class - Either has a human or computer select provide clues about secret code
class Codemaker
  attr_reader :code

  def initialize
    @code = generate_code
  end

  # check out batmangoo's solution
  def get_clues(guess)
    guess_arr = guess.split('')
    code_arr = code.split('')
    guess_arr.each_with_index { |color, index|
      if color == code_arr[index]
        guess_arr[index] = 'C'
        code_arr[index] = 'C'
      elsif code_arr.include?(color)
        code_arr[code_arr.find_index(color)] = 'P'
        guess_arr[index] = 'P'
      elsif !code_arr.include?(color)
        guess_arr[index] = 'X'
      end
    }
    guess_arr.delete('X')
    clues = guess_arr.sort
  end

  private

  def generate_code
    code_array = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    p code_array.join('')
  end
end
maker = Codemaker.new
p maker.get_clues('5613')
