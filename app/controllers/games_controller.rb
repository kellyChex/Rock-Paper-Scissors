class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      if @game.update_score == 'tie'
        flash[:notice] = "Tie"
      elsif @game.compare_choices == 'player1'
        flash[:notice] = 'Player 1 Wins!'
      else
        flash[:notice] = "Player 2 Wins!"
      end
        redirect_to root_path
    end
  end

  def game_params
    params.require(:game).permit(:player1, :player2)
  end
end
