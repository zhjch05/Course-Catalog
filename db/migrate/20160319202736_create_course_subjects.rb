class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects, :id => false do |t|
      t.integer :course_id
      t.integer :subject_id
    end
  end
end
