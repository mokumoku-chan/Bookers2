class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}


  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to book_path(current_user.id)
    end
  end


  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id:@user.id)
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
