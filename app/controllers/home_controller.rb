class HomeController < ApplicationController
  def index
    attending_events = @current_user.events
    @event = attending_events
    @group_events = @current_user.possible_events
    render({ :template => "group_planning/index.html.erb" })
  end


end
