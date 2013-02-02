class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :num
      t.integer :faculty_id

      t.timestamps
    end
  end
end
