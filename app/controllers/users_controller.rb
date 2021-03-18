class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit,]
  before_action :correct_user, only: [:destroy,  :update]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.order(id: :desc).page(params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def edit
  @user = User.find(params[:id])
  end
  
  
  def update
    @user= User.find(params[:id])
  
    if @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールが編集できませんでした"
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
  end
  
  def favorites
    @user = User.find(params[:id])
    @fav_recipes = @user.fav_recipes.order('created_at DESC').page(params[:page])
  end

private



  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
