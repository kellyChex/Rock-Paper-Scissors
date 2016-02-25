class Game <ActiveRecord::Base

  before_save :update_score

  def compare_choices
    if player1 == "a" && player2 == 1 ||
      (player1 == 's' &&  player2 == 2) || (player1 == 'd' &&  player2 == 3)
      return 'Tie'
    elsif (player1 == "a"  && player2 == 3) ||
      (player1 == 's' &&  player2 == 1) || (player1 == 'd' &&  player2 == 2)
      return 'player1'
    else
      return 'player2'
    end
  end

  def update_score
    result = compare_choices

    if result == 'player1'
      self.player1_score = 1
    elsif result == 'player2'
      self.player2_score = 1
    end
  end
end
