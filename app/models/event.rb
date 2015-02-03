class Event < ActiveRecord::Base

	belongs_to :creator, :class_name => "User"
	has_many :attendees, :through => :invites
	has_many :invites, :foreign_key => :attendee_event_id

end
