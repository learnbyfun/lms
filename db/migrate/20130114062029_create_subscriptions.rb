class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
    	t.integer "course_id"
    	t.integer "topic_id"
    	t.boolean "Approve"
    	t.string "Approve_by"
    	t.datetime "Approved_date"
      t.timestamps
    end
  end

  def self.down
  	drop_table :subscription
  end
end
