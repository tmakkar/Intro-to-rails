class BooksController < ApplicationController
  def index
    @books = Book.where("title ILIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
  end
  
  
  def show
    @book = Book.find(params[:id])
  end
end
