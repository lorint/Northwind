class User < ActiveRecord::Base
	has_many :outgoing_requests, class_name: "FriendRequest", foreign_key: :friender_id, inverse_of: :friender
	has_many :incoming_requests, class_name: "FriendRequest", foreign_key: :friendee_id, inverse_of: :friendee

	# TWO alternatives to validate presence of both handle and email:

	# validates :email, presence: true
	# validates :handle, presence: true

	validates_presence_of :email, :handle
end
