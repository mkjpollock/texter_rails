class User < ActiveRecord::Base

  has_many :contacts, :foreign_key => "user_id", :class_name => "Contact"
  has_many :receivers, :through => :contacts
  has_many :messages, :through => :contacts

  validates :phone, length: { is: 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
