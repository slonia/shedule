class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :group_id
      t.integer :num

      t.timestamps
    end
  end
end
