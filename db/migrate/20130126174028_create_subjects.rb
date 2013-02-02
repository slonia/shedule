class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :day_id
      t.string :name
      t.string :place
      t.string :teacher
      t.integer :type
      t.integer :num

      t.timestamps
    end
  end
end
