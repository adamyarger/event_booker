class Event < ActiveRecord::Base

	belongs_to :creator, :class_name => "User"
	has_many :attendees, :through => :invites
	has_many :invites, :foreign_key => :attendee_event_id

	validates :title, presence: true
	validates :location, presence: true
	validates :data, presence: true
	validates :description, presence: true

	scope :upcoming, -> {where("Date >= ?", Date.today).order('Data ASC')}
	scope :past, -> {where("Date < ?", Date.today).order('Data DESC')}

end
