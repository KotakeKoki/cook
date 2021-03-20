class TlController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user
    def index
    if logged_in?
      @recipe = current_user.recipes.build
      @recipes = current_user.feed_recipes.order(id: :desc).page(params[:page]).per(6)
    end
    end
end