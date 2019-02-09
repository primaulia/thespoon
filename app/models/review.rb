class Review < ApplicationRecord
  belongs_to :restaurant
  # validates_presence_of :content
  validates :content, presence: true
end
