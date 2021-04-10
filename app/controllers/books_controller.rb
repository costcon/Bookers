class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
