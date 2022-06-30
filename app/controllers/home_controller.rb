class HomeController < ApplicationController
    def index
      @title = "Home"
    if current_user
      @players = Player.where(:id_user => current_user.id)
    end
  end
end