class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :uid
      t.text :comment
      t.text :code
      t.text :continuity_id
      t.text :name
      t.text :description
      t.text :credits
      t.boolean :independent_study

      t.timestamps null: false
    end
  end
end
