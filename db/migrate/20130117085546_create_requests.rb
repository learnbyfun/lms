class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
    	t.references :course
    	t.references :user
    	t.boolean :approve
    	t.integer :approved_by
    	t.datetime :approved_date
    	t.timestamps
    end
  end

  def down
  	drop_table :requests
  end
end
