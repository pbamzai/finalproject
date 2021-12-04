class GroupEventsController < ApplicationController
  def index
    matching_group_events = GroupEvent.all

    @list_of_group_events = matching_group_events.order({ :created_at => :desc })

    render({ :template => "group_events/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_group_events = GroupEvent.where({ :id => the_id })

    @the_group_event = matching_group_events.at(0)

    render({ :template => "group_events/show.html.erb" })
  end

  def create
    the_group_event = GroupEvent.new
    the_group_event.group_id = params.fetch("query_group_id")
    the_group_event.event_id = params.fetch("query_event_id")

    if the_group_event.valid?
      the_group_event.save
      redirect_to("/group_events", { :notice => "Group event created successfully." })
    else
      redirect_to("/group_events", { :notice => "Group event failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_group_event = GroupEvent.where({ :id => the_id }).at(0)

    the_group_event.group_id = params.fetch("query_group_id")
    the_group_event.event_id = params.fetch("query_event_id")

    if the_group_event.valid?
      the_group_event.save
      redirect_to("/group_events/#{the_group_event.id}", { :notice => "Group event updated successfully."} )
    else
      redirect_to("/group_events/#{the_group_event.id}", { :alert => "Group event failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group_event = GroupEvent.where({ :id => the_id }).at(0)

    the_group_event.destroy

    redirect_to("/group_events", { :notice => "Group event deleted successfully."} )
  end
end
