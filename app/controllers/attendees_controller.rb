class AttendeesController < ApplicationController
  def index
    matching_attendees = Attendee.all

    @list_of_attendees = matching_attendees.order({ :created_at => :desc })

    render({ :template => "attendees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_attendees = Attendee.where({ :id => the_id })

    @the_attendee = matching_attendees.at(0)

    render({ :template => "attendees/show.html.erb" })
  end

  def create
    the_attendee = Attendee.new
    the_attendee.event_id = params.fetch("query_event_id")
    the_attendee.user_id = params.fetch("query_user_id")
    the_attendee.rsvp = params.fetch("query_rsvp", false)

    if the_attendee.valid?
      the_attendee.save
      redirect_to("/", { :notice => "Attendee created successfully." })
    else
      redirect_to("/attendees", { :notice => "Attendee failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attendee = Attendee.where({ :id => the_id }).at(0)

    the_attendee.event_id = params.fetch("query_event_id")
    the_attendee.user_id = params.fetch("query_user_id")
    the_attendee.rsvp = params.fetch("query_rsvp", false)

    if the_attendee.valid?
      the_attendee.save
      redirect_to("/attendees/#{the_attendee.id}", { :notice => "Attendee updated successfully."} )
    else
      redirect_to("/attendees/#{the_attendee.id}", { :alert => "Attendee failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attendee = Attendee.where({ :id => the_id }).at(0)

    the_attendee.destroy

    redirect_to("/", { :notice => "Attendee deleted successfully."} )
  end
end
