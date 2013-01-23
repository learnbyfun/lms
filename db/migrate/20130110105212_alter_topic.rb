class AlterTopic < ActiveRecord::Migration
  def up
  	add_column :topics, :file_type, :string
  	add_column :topics, :link, :string
  end

  def down
  	remove_column :topics, :file_type
  	remove_column :topics, :link
  end
end
