class RecipesController < ApplicationController

#   recipes GET    /recipes(.:format)          recipes#index
#             POST   /recipes(.:format)          recipes#create
#  new_recipe GET    /recipes/new(.:format)      recipes#new
# edit_recipe GET    /recipes/:id/edit(.:format) recipes#edit
#      recipe GET    /recipes/:id(.:format)      recipes#show
#             PATCH  /recipes/:id(.:format)      recipes#update
#             PUT    /recipes/:id(.:format)      recipes#update
#             DELETE /recipes/:id(.:format)      recipes#destroy

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end


# ????????
  private
  def recipe_params
    params.require(:recipe).permit(:name, :servings)
  end


end