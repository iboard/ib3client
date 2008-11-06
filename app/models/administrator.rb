class Administrator < ActiveRecord::Base
  validates_presence_of   :username
  validates_uniqueness_of :username
  acts_as_tree
end
