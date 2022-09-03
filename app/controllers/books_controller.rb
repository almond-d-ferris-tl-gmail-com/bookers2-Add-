class BooksController < ApplicationController
  def new
    @book = Book.new
  end

 # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all #同じアクション内で同じメソッドは使えない
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all #同じアクション内で同じメソッドは使えない
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
