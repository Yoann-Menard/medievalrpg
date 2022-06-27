class QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end
  def show
    @quest = Quest.find(params[:id])
  end
  def new
    @quest = Quest.new
  end
  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to quests_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  # def edit
  #   @quest = Quest.find(params[:id])
  # end
def update
  @quest = Quest.find(params[:id])
  if @quest.update(quest_params)
    redirect_to quests_path
  else
    render :edit, status: :unprocessable_entity
  end
  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to quests_path
  end
 end
end