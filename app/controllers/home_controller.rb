class HomeController < ApplicationController
  def index
    @user_name = "Maria"
    @unread_count = 3
  end
end
