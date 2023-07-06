class HomeController < ApplicationController
  def index
    unless user_signed_in?
      @user = User.new
    end
  end
end
