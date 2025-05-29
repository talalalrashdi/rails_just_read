class BooksController < ApplicationController
  def index

    @books = Book.all
    if params[:query].present?
      @books = Book.search_by_title_description_author(params[:query])
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
    @book = Book.new
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
