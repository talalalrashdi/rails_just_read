class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :profile

  def profile

    @user = current_user
    @userid =  current_user.id

    @books = current_user.books

    @review = current_user.reviews
  end

  def dashboard
  end
end
