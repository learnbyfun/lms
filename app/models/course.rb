class Course < ActiveRecord::Base
   attr_accessible :name, :parent_id,:topic_ids

   has_many :subscriptions
   has_many :topics, :through => :subscriptions

   has_many :requests
   
   #scope :is_course_requested, where(:course_id => ?)

   acts_as_nested_set  :before_add     => :do_before_add_stuff,
                      :after_add      => :do_after_add_stuff,
                      :before_remove  => :do_before_remove_stuff,
                      :after_remove   => :do_after_remove_stuff

  private

  def do_before_add_stuff(child_node)
    # do whatever with the child
  end

  def do_after_add_stuff(child_node)
    # do whatever with the child
  end

  def do_before_remove_stuff(child_node)
    # do whatever with the child
  end

  def do_after_remove_stuff(child_node)
    # do whatever with the child
  end
end
