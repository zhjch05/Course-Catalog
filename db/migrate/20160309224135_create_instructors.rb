class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.text :uid
      t.text :comment
      t.text :email
      t.text :first
      t.text :middle
      t.text :last

      t.timestamps null: false
    end
  end
end
