class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(player1: game_params[:player1], player2: game_params[:player2])
      if @game.save
        if @game.player1_score == 1
          flash[:notice] = "Player 1 Wins"
        elsif @game.player2_score == 1
          flash[:notice] = 'Player 2 Wins!'
        else
          flash[:notice] = "Tie"
        end
        redirect_to root_path
      end
  end

  def game_params
    params.require(:game).permit(:player1, :player2)
  end
end
