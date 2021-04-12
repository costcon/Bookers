class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def top
  end

  def index
    @book = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def create
    @newbook = Book.new(book_params)
    if @newbook.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@newbook.id)
    else
      flash[:alert] = "error!! can't be blank."
      redirect_to books_path
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "error!! can't be blank."
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end



end
