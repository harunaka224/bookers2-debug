class Message < ApplicationRecord
  
  validates :content, length: { maximum: 140 } 
  
  belongs_to :user
  belongs_to :room
end
