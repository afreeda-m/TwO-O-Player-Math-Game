# define a Player class to set player information
class Player
  attr_reader :name, :lives, :score

  # set initial data
  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  # set lives
  def decrease_lives
    @lives -= 1
  end

  # set score
  def update_score
    @score += 1
  end
end