class BooksController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}

  def ensure_current_user
    book = Book.find(params[:id])
    if book.user_id.to_i != current_user.id
      redirect_to books_path
    end
  end

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path

  end


  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)

  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)

  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
