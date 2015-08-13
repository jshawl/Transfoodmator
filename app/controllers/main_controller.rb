class MainController < ApplicationController
  # consider using a more semantic name than main controller
  # can the index action be moved to the recipes controller?
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = Recipe.all
  end
end
