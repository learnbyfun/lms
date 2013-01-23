class AlterCoursesTopics < ActiveRecord::Migration
  def self.up
  	add_column :courses_topics, :approve, :boolean
  	add_column :courses_topics, :approved_by, :string
  	add_column :courses_topics, :approved_date, :datetime
  end

  def self.down
  	remove_column :courses_topics, :approve
  	remove_column :courses_topics, :approved_by
  	remove_column :courses_topics, :approved_date

  end
end
