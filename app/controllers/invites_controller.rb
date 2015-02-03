class InvitesController < ApplicationController
	
	def create
		@event = Event.find(params[:invite][:attendee_event_id])
		current_user.attend!(@event)
		redirect_to @event
	end

	def destroy
		@event = Invite.find(params[:id]).attendee_event
		current_user.cancel!(@event)
		redirect_to @event
	end
end
