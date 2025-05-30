class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

    @books = Book.all

    # returns result set if search query present
    if params[:query].present?
      @books = Book.search_by_title_description_author(params[:query])
    end

    # returns empty instance of books to populate category filter
    if params[:category_id].present?
      @books = @books.where(category_id: params[:category_id])
    end

    # The `geocoded` scope filters only books with coordinates
    @markers = @books.map do |book|
      {
        lat: book.user.latitude,
        lng: book.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {book: book}),
        marker_html: render_to_string(partial: "marker", locals: {book: book})
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
