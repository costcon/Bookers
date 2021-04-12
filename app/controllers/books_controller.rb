class BooksController < ApplicationController


  def top
  end

  def index
    @book = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.save
    redirect_to books_path(@newbook.id)
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book)
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
