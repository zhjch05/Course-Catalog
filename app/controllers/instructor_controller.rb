class InstructorController < ApplicationController
  before_action :authenticate_user!
  def index
    @instructors = Instructor.all.uniq.order(:first)
  end
end
