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
    if admin
    @quest = Quest.new(quest_params)
    else
      redirect_to_root_path
    end
    if @quest.save
      flash[:success] = "Quest created"
      redirect_to quests_path
    else
      render :new, status: :unprocessable_entity
    end
  end

def update
  @quest = Quest.find(params[:id])
  if @quest.update(quest_params)
    redirect_to quests_path
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to quests_path
  end

    def quest_params
      params.require(:quest).permit(:title, :exp, :item, :content, :png)
    end

 end