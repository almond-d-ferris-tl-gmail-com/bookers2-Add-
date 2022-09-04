class UsersController < ApplicationController

  def index
    @books = Book.all #同じアクション内で同じメソッドは使えない
    @book = Book.new
    @user = User.find(params[:id])
  end

  def show
    #@book = Book.find(params[:id])
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books #同じアクション内で同じメソッドは使えない
    #@book = @user.book.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

end
