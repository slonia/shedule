class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :subjects, :type, :sub_type
  end

  def down
  end
end
