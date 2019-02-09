class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, message: 'Please type your name' #use this better helper to write your validation message
  validates_uniqueness_of :name, message: 'Name must be unique'

  validates_presence_of :address, message: 'Please type your address'
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
