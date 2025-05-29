class PagesController < ApplicationController
  def profile
  end

  def dashboard
    p current_user
  end
end
