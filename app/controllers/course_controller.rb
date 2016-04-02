class CourseController < ApplicationController
  before_action :authenticate_user!
  helper_method :include
  def index
    if params[:subject].present?
      @courses = Subject.find_by_id(params[:subject]).courses
    else
      @courses = Course.all.uniq.order(:name)
    end
    if params[:search]
      @courses = @courses.search(params[:search]).order(:name)
    end
    @enrollment = Enrollment.new
    @subjects = Subject.all.uniq.order(:name)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def include(course)
    current_user.courses.find_by_id(course.id)
  end
end
