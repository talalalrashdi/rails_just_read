class BooksController < ApplicationController
  def index
  
    @books = Book.all
    
    # The `geocoded` scope filters only books with coordinates
    @markers = @books.geocoded.map do |book|
    {
      lat: flat.latitude,
      lng: flat.longitude
    }
    end
  end
  
  

  def show
    @book = Bookk.new
    @review = Review.new(list: @list)
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
