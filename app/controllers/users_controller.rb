class UsersController < ApplicationController
  def index
    @users = User.all
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
  end
end
