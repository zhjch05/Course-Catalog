class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
