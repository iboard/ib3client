class Account < ActiveRecord::Base
  validates_presence_of   :username
  validates_uniqueness_of :username
  
  belongs_to              :administrator
end
