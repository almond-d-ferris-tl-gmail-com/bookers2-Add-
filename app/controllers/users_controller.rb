class UsersController < ApplicationController

  def index
    @books = Book.all #同じアクション内で同じメソッドは使えない
    @book = Book.new
    @users = User.all
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
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
