class BoardController < ApplicationController
  before_action :set_board, only: %i[init player_move]

  def create
    board = Board.create!

    render json: { response: "board created successfully with id: #{board.id}" }
  end

  def init
    if request.body.read == 'START'
      @board.init
      render json: { response: 'READY' }, status: :ok
    else
      render json: { response: 'Invalid request' }, status: :bad_request
    end
  end

  def player_move
    response = @board.player_move(request.body.read.to_i)
    case response
    when 1
      render json: { response: "Game already finished and won by #{@board.winner}" }, status: :ok
    when 2
      render json: { response: 'invalid dice throw!' }, status: :unprocessable_entity
    else
      render json: response, status: :ok
    end
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])

    render json: { response: 'invalid board selected' }, status: :bad_request if @board.blank?
  end
end
