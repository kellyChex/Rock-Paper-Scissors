class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    end
  end

  def game_params
    params.require(:game).permit(:player1, :player2)
  end
end
