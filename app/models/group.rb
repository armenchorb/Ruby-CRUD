class Group < ActiveRecord::Base
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  belongs_to :user
  has_many :joins
  has_many :users, through: :joins
end
