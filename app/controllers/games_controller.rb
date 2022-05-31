class GamesController < ApplicationController

  before_action :authenticate_user!  

  def show
    @game = Game.find(params[:id])
    @game.NameAnswer = ""
    @game.OriginAnswer = ""
    render :show
  end

  def check
    @game = Game.find(params[:id])
    if @game.update(params.require(:game).permit(:NameAnswer, :OriginAnswer)) && (@game.NameAnswer == @game.CatName && @game.OriginAnswer == @game.CatOrigin)
      flash.now[:success] = "Correct!"
    else
      flash.now[:error] = "Incorrect!"
    end
    render :show
  end

end
