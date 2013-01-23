class Altercourses < ActiveRecord::Migration
  def up
  	add_column :courses, :lft, :integer
  	add_column :courses, :rgt, :integer
  end

  def down
  	remove_column :courses, :lft
  	remove_column :courses, :rgt
  end
end
