class UsersController < ApplicationController
  def show
    #@book = Book.find(params[:id])
    @books = Book.all #同じアクション内で同じメソッドは使えない
    @book = Book.new
    #@user = User.find(params[:id])
    #@book = @user.book.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
end