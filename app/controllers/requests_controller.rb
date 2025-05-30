class RequestsController < ApplicationController
  # controller actions to set book request status
  def create
    # look if there is an existing request of this user/book combination
    # and only create a new one, if it has expired
    if Request.find_by(book_id: params[:book_id], user_id: params[:user_id]) && Request.find_by(book_id: params[:book_id], user_id: params[:user_id]).expired?
      request = Request.find_by(book_id: params[:book_id], user_id: params[:user_id])
    else
      request = Request.new(book_id: params[:book_id], user_id: params[:user_id])
    end
    # set the request status to 'pending'
    request.update(status: :pending)
    redirect_to dashboard_path, notice: "Request created."
  end

  def accept
    redirect_to dashboard_path, notice: "Request accepted."
  end

  def reject
    redirect_to dashboard_path, alert: "Request declined."
  end

  def expire
    redirect_to dashboard_path, alert: "Request marked as expired."
  end
end
