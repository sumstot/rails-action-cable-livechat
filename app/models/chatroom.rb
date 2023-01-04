class Chatroom < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :name
end
