class User < ActiveRecord::Base
	

	has_many :events, :foreign_key => :creator_id, :class_name => "Event"

	has_many :invites, :foreign_key => :attendee_id
	has_many :attendee_events_id, :foreign_key => :creator_id

	validates :name, presence: true
	validates :email, presence: true
  
	before_create :create_remember_token



	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	Digest::SHA1.hexdigest(token.to_s)
	end

	  def attending?(event)
	    event.attendees.include?(self)
	  end

	  def attend!(event)
	    self.invites.create!(attendee_event_id: event.id)
	  end

	  def cancel!(event)
	    self.invites.find_by(attendee_event_id: event.id).destroy
	  end

	private

		def create_remember_token
		  self.remember_token = User.digest(User.new_remember_token)
		end
end
