class CourseController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:subject].present?
      @courses = Subject.find_by_id(params[:subject]).courses
    else
      @courses = Course.all.uniq.order(:name)
    end
    if params[:search]
      @courses = @courses.search(params[:search]).order(:name)
    end
  end
end
