class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :profile

  def profile
  end

  def dashboard
  end
end
