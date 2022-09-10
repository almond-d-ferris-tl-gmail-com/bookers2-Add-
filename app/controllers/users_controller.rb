class UsersController < ApplicationController

  def index
    @books = Book.all #同じアクション内で同じメソッドは使えない
    @book = Book.new
    #@user = User.find(params[:id])
  end

  def create
    flash[:notice] = "successfully"
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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "successfully"
  end

# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
