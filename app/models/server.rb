class Server < ActiveRecord::Base
  belongs_to :administrator, :foreign_key => :user_id
end
