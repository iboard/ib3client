class Administrator < ActiveRecord::Base
  validates_presence_of   :username
  validates_uniqueness_of :username
  has_many                :servers, :foreign_key => :user_id
  acts_as_tree
  
  named_scope :top_level_administrators, lambda { {:conditions => ['parent_id = 0 or parent_id = ?', nil]} }
  
  def fullname
    user = User.find(:all).detect { |u| 
      u.username == username
    }
    [user.given_name, user.sn].join(" ")
  end
  

  
end
