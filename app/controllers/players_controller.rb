class PlayersController < ApplicationController
  def index
    if current_user
      @players = Player.where(:id_user => current_user.id)

    else
      redirect_to_root_path
    end
  end
  def new 
    if current_user
      @player = Player.new
    else
      redirect_to_root_path
    end
  end

  def show
    if current_user
      @player = Player.find(params[:id])
    else
      redirect_to_root_path
    end

  def create
    @player = Player.new(player_params)
    @player.level = 1
    @player.strength = 10
    @player.hp = 10
    @player.points = 10
    @player.id_user = current_user.id 
    if @player.save
      flash[:success] = "Player created"
      redirect_to players_path
    else
      render :new, status: :unprocessable_entity
    end

    def player_params
      params.require(:player).permit(:name)
    end
  end