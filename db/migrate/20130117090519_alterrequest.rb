class Alterrequest < ActiveRecord::Migration
  def up
  	rename_column :requests, :user_id_id, :user_id
  	rename_column :requests, :course_id_id, :course_id
  end

  def down
  end
end
