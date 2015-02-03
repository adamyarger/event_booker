class Invite < ActiveRecord::Base
	belongs_to :attendee, class_name: "User"
	belongs_to :attendee_event, class_name: "Event"

	validates :attendee_id, presence: true
	validates :attendee_event, presence: true
end
