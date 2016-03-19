class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses_enrolled = current_user.courses
    @test_course_subject = Course.all.sample.subjects
  end
end
