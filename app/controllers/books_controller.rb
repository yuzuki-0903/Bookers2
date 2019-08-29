class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,{only: [:edit, :update]}

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice]="successfully"
        redirect_to book_path(@book)
    else
    render 'edit'
    end
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        flash[:notice]="successfully"
        redirect_to book_path(@book.id)
    else
    @user = current_user
    @books = Book.all
    render 'index'
    end
  end

def destroy
  book = Book.find(params[:id])
  book.destroy
   redirect_to books_path
end
private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def correct_user
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
     redirect_to books_path
    end
  end
end

