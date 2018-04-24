class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  has_many :groups
  has_many :joins
  has_many :joined_groups, through: :joins, source: :group
end
