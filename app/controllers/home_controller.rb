class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses_enrolled = current_user.courses
  end
end
