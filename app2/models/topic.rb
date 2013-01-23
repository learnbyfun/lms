class Topic < ActiveRecord::Base
   attr_accessible :name, :file_type, :link

   has_many :subscriptions
  has_many :courses, :through => :subscriptions
end
