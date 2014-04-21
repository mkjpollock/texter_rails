class Contact < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :receiver, :foreign_key => "receiver_id", :class_name => "User"
  has_many :messages
end
