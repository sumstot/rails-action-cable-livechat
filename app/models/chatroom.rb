class Chatroom < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }

  def self.make_private_room(users, room_name)
    private_chatroom = Chatroom.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, chatroom_id: chatroom.id )
    end
    private_chatroom
  end
end
