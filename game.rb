class Game
  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = @players.first
  end

  def switch_player
    @current_player = @current_player == @players.first ? @players.last : @players.first
  end

  def start
    # continue looping until one player runs out of lives
    until game_over?
      question = Question.new
      puts "#{@current_player.name}: #{question.ask_question} \nAnswer: "
      answer = gets.chomp

      # either update the score or decrease a life depending on right answer
      if question.correct_answer?(answer)
        puts "Correct! You earn a point."
        @current_player.update_score
      else
        puts "Wrong answer! You lose a life."
        @current_player.decrease_lives
      end

      display_scores
      switch_player
      puts "--------------- NEW TURN ---------------"
    end

    announce_winner
  end

  # check if any player's life is 0
  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def announce_winner
    # find highest scoring player
    winner = @players.max_by{|player| player.score }
    puts "#{winner.name} wins with a score of #{winner.score}!"
    puts "--------------- GAME OVER ---------------"
  end

  # display each player score
  def display_scores
    @players.each do |player|
      puts "#{player.name}: Lives - #{player.lives}, Score - #{player.score}"
    end
  end
end