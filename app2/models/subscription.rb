class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :course
  belongs_to :topic
end
