require 'pry'

class WordProblem
  OPERATORS = %w(plus minus multiplied divided)

  def initialize(question)
    @question = question
    @operators = []
    @numbers = []
    fill_operators
    fill_numbers
  end

  def answer
    if @operators.empty?
      raise ArgumentError.new("Wasn't one of: plus, minus, multiplied, divided")
    else
      answer = @numbers.shift.send @operators.shift, @numbers[0]
      loop do
        break if @operators.empty?
        current_operator = @operators.shift
        @numbers.shift
        answer = answer.send current_operator, @numbers[0]
      end
      answer
    end
  end

  private

  def to_operator(string)
    case string
    when 'plus'
      '+'
    when 'minus'
      '-'
    when 'multiplied'
      '*'
    when 'divided'
      '/'
    end
  end

  def fill_operators
    @question.each_line(' ') do |word|
      if OPERATORS.include?(word.strip)
        @operators << to_operator(word.strip)
      end
    end
  end

  def fill_numbers
    @question.each_line(' ') do |word|
      if /\d+/ =~ word
        @numbers << word.to_i
      end
    end
  end
end
