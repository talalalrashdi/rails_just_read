class BooksController < ApplicationController
  def index

    # The `geocoded` scope filters only books with coordinates
  @markers = @books.geocoded.map do |book|
    {
      lat: flat.latitude,
      lng: flat.longitude
    }
    end
  end
end
