class CourseController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.all.uniq.order(:name)
  end
end
