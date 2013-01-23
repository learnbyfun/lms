class CoursesTopics < ActiveRecord::Migration
   def self.up
      create_table :courses_topics, :id => false do |t|
        t.references :course
        t.references :topic
        t.timestamps
      end
    end

    def self.down
      drop_table :courses_topics
  end
end
