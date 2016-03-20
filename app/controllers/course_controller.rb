class CourseController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search]
      @courses = Course.search(params[:search]).order(:name)
    else
      @courses = Course.all.uniq.order(:name)
    end
  end
end
