class RequestsController < ApplicationController
  # controller actions to set requests
  def create
    request = Request.find(params[:id])
    request.update(status: :pending)
    redirect_to requests_path, notice: "Request created."
  end

  def accept
    request = Request.find(params[:id])
    request.update(status: :accepted)
    redirect_to requests_path, notice: "Request accepted."
  end

  def reject
    request = Request.find(params[:id])
    request.update(status: :declined)
    redirect_to requests_path, alert: "Request declined."
  end

  def expire
    request = Request.find(params[:id])
    request.update(status: :expired)
    redirect_to requests_path, alert: "Request marked as expired."
  end
end
