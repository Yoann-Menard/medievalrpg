class PlayersController < ApplicationController
  def index
    if current_user
      @players = Player.where(:id_user => current_user.id)
    else
      redirect_to root_path
    end
end

  def new 
    if current_user
      @player = Player.new
    else
      redirect_to root_path
    end
  end

  def show
    if current_user
      @player = Player.find(params[:id])
    else
      redirect_to root_path
    end
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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

    def player_params
      params.require(:player).permit(:name,)
    end
  end

#   class ArticlesController < ApplicationController
#   before_action :set_article, only: %i[ show edit update destroy ]

#   # GET /articles or /articles.json
#   def index
#     @articles = Article.all
#   end

#   # GET /articles/1 or /articles/1.json
#   def show
#   end

#   # GET /articles/new
#   def new
#     @article = Article.new
#   end

#   # GET /articles/1/edit
#   def edit
#   end

#   # POST /articles or /articles.json
#   def create
#     @article = Article.new(article_params)

#     respond_to do |format|
#       if @article.save
#         format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
#         format.json { render :show, status: :created, location: @article }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @article.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /articles/1 or /articles/1.json
#   def update
#     respond_to do |format|
#       if @article.update(article_params)
#         format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
#         format.json { render :show, status: :ok, location: @article }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @article.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /articles/1 or /articles/1.json
#   def destroy
#     @article.destroy

#     respond_to do |format|
#       format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_article
#       @article = Article.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def article_params
#       params.fetch(:article, {})
#     end
