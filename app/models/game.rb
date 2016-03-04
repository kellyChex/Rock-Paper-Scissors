class Game < ActiveRecord::Base

  before_save :update_score

  def compare_choices
    { rock:
      {
        rock: :tie,
        paper: :player2_wins,
        scissors: :player1_wins
      },
      paper:
      {
        rock: :player1_wins,
        paper: :tie,
        scissors: :player2_wins
      },
      scissors:
      {
        rock: :player2_wins,
        paper: :player1_wins,
        scissors: :tie
      }
    }
  end

  def update_score
    player1_choices = {
      "a": :rock,
      "s": :paper,
      "d": :scissors
    }

    player2_choices = {
      "1": :rock,
      "2": :paper,
      "3": :scissors
    }

    player_1_choice = player1_choices[player1.to_sym]
    player_2_choice = player2_choices[player2.to_sym]

    result = compare_choices[player_1_choice][player_2_choice]

    if result == :player1_wins
      self.player1_score = 1
    elsif result == :player2_wins
      self.player2_score = 1
    else
      self.player1_score = 0
      self.player2_score = 0
    end
  end
end
