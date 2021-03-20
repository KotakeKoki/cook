class TlController < ApplicationController
    before_
    def index
    if logged_in?
      @recipe = current_user.recipes.build
      @recipes = current_user.feed_recipes.order(id: :desc).page(params[:page]).per(6)
    end
    end
end