class CourseSearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @subjects = Subject.all.uniq.order(:name)
  end
end
