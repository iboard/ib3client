class Administrator < ActiveRecord::Base
  validates_presence_of   :username
  validates_uniqueness_of :username
  has_many                :servers, :foreign_key => :user_id
  acts_as_tree
end
