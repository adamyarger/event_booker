class EventsController < ApplicationController

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to event_path(@event)
		else
			render 'new'
		end
	end

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def event_params
			params.require(:event).permit(:title, :location, :description, :data)
		end

end
