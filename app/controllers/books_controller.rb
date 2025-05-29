class BooksController < ApplicationController
  def index

    @books = Book.all

    # The `geocoded` scope filters only books with coordinates
    @markers = @books.map do |book|
    {
      lat: book.user.latitude,
      lng: book.user.longitude
    }
    end
  end

  def show
    # @review = Review.new(book: @book)
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(list_params)
    if @book.save
      redirect_to list_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:book).permit(:title, :description, :author, :category, :user)
  end
end
