class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask_question
    "What is #{@num1} + #{@num2}?"
  end

  def correct_answer?(answer)
    answer.to_i == @num1 + @num2
  end
end