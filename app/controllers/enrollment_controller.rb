class EnrollmentController < ApplicationController
  def index
  end

  def new
    @enrollment = Enroll.new
  end

  def create
    @enrollment = Enrollment.new
    @enrollment.course_id = params[:course_id]
    @enrollment.user_id = params[:user_id]
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to home_index_path, notice: "Enrollment completed." }
        format.json { render json: @enrollment, status: :created, location: @enrollment }
      else
        format.html { redirect_to home_index_path, notice: "Enrollment not completed." }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity}
      end
    end
  end
end
