class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :uid
      t.text :comment
      t.text :term
      t.text :name
      t.text :abbreviation

      t.timestamps null: false
    end
  end
end
