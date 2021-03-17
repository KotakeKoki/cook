class RecipesController < ApplicationController
  before_action :require_user_logged_in, only: [:new,:create,]
  before_action :correct_user, only: [:destroy, :edit, :update]
def index
  @recipes = Recipe.all
end

def show
  @recipe = Recipe.find(params[:id]) 
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = current_user.recipes.build(recipe_params)
  if @recipe.save
    flash[:success] = "レシピが投稿されました"
    redirect_to root_url
  else
    flash.now[:danger] = "レシピが投稿されませんでした"
    render :new
  end
end

def edit
@recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  
  if @recipe.update(recipe_params)
    flash[:success] = "レシピを編集しました"
    redirect_to @recipe
  else
    flash.now[:danger] = "レシピが編集できませんでした"
    render :edit
  end
end

def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy
  
  flash[:success] = "レシピを削除しました"
  redirect_to recipes_url
end

private

def recipe_params
  params.require(:recipe).permit(:title, :ingridient_1, :ingridient_2, :description, :sentence, :user_id, :image)
end

def correct_user
  @recipe = current_user.recipes.find_by(id: params[:id])
  unless @recipe
  redirect_to root_url
  end
end

end
