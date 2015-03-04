class FriendRequest < ActiveRecord::Base
	belongs_to :friender, class_name: "User", foreign_key: :friender_id, inverse_of: :outgoing_requests
	belongs_to :friendee, class_name: "User", foreign_key: :friendee_id, inverse_of: :incoming_requests
end
