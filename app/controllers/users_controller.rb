class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil if current_user == @user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You can only edit or delete your own articles"
      redirect_to user_path(current_user)
    end
  end
end
