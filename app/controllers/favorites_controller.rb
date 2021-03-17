class FavoritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.fav(recipe)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfav(recipe)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to recipe
  end
end
