class GameScorer
   def self.player1_total
      Game.where(player1_score: 1).count
   end

   def self.player2_total
      Game.where(player2_score: 1).count
   end
end
