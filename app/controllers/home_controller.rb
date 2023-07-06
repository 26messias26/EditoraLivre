class HomeController < ApplicationController
  def index
    if user_signed_in?
      @publication = current_user.publications.build
    else
      @user = User.new
    end

    @publications = Publication.order(created_at: :desc)

  end
  
end
