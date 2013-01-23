class HomeController < ApplicationController
  def index
    @users = User.all
    
  end

  def logout
  	redirect_to(users_path)
  end
end
