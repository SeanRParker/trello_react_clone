class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def create
    @board = Board.create(board_params)
    if @board.save
      render json: @board
    else
      render json: {errors: @boards.errors.full_messages }
    end
  end

  def update
    board = Board.find(params[:id]);
    if board.update(board_params)
      render json: board
    else
      render json: { errors: board.errors.full_messages }
    end
  end


  def destroy
     if Board.find(params[:id]).destroy
       render json: { id: params[:id].to_i }
     else
       render json: { errors: "Board could not be deleted try again" }
     end
   end


  private
    def board_params
      params.require(:board).permit(:name, :description)
    end
end
