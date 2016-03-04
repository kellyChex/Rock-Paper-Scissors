class Game <ActiveRecord::Base

  before_save :update_score

  def compare_choices
    if player1 == "a" && player2 == 1 ||
      (player1 == 's' &&  player2 == 2) || (player1 == 'd' &&  player2 == 3)
      return 'tie'
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
      player1_score = 1
    elsif result == 'player2'
      player2_score = 1
    else
      player1_score = 0
      player2_score = 0
    end
  end

  #   player1_choices = {
  #     "a": :rock,
  #     "s": :paper,
  #     "d": :scissors
  #   }
  #
  #   player2_choices = {
  #     "1": :rock,
  #     "2": :paper,
  #     "3": :scissors
  #   }
  #
  #   player1_choices.each do |key, value|
  #     if player1 == key
  #       player1_choice << value
  #     end
  #   end
  #
  #   player2_choices.each do |key, value |
  #     if player2 == key
  #       player2_choice << value
  #     end
  #   end
  # end
  #
  # def compare_choices
  #   { rock:
  #     {
  #       rock: :tie,
  #       paper: :player2_wins,
  #       scissors: :player1_wins
  #     },
  #     paper:
  #     {
  #       rock: :player1_wins,
  #       paper: :tie,
  #       scissors: :player2_wins
  #     },
  #     scissors:
  #     {
  #       rock: :player2_wins,
  #       paper: :player1_wins,
  #       scissors: :tie
  #     }
  #   }
  #
  # def update_score
  #   result = compare_choices[:player1_choice][:player2_choice]
  #
  #   if result == :player1_wins
  #     player1_score = 1
  #     return 'player1'
  #   elsif result == :player2_wins
  #     player2_score = 1
  #     return 'player2'
  #   else
  #     player1_score = 0
  #     player2_score = 0
  #     return 'tie'
  #   end
  # end
 #
 # method_hook :update_score, :after => :choice_organizer

end
