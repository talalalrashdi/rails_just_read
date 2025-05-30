class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :profile

  def profile

    @user = current_user
    @userid =  current_user.id

    @books = current_user.books

    @review = current_user.reviews
  end

  def dashboard
    @requests_pending = Request.joins(:book).where(books: { user_id: current_user.id }, status: :pending)
    @requests_accepted = Request.joins(:book).where(books: { user_id: current_user.id }, status: :accepted)
    @requests_declined = Request.joins(:book).where(books: { user_id: current_user.id }, status: :rejected)
    @requests_expired = Request.joins(:book).where(books: { user_id: current_user.id }, status: :expired)
    @my_requests = Request.where(user_id: current_user.id, status: :accepted)
  end
end
