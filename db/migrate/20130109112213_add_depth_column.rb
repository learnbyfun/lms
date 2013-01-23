class AddDepthColumn < ActiveRecord::Migration
  def up
  	add_column :courses, :depth, :integer
  end

  def down
  	remove_column :courses, :depth
  end
end
