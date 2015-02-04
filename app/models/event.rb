class Event < ActiveRecord::Base

	belongs_to :creator, :class_name => "User"
	has_many :attendees, :through => :invites
	has_many :invites, :foreign_key => :attendee_event_id

	validates :title, presence: true
	validates :location, presence: true
	validates :data, presence: true
	validates :description, presence: true

	default_scope -> { order('data ASC')}
	scope :future, -> { where "data > ?", Time.zone.now }
	scope :past, -> { where "data <= ?", Time.zone.now }

end
