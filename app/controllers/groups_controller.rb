class GroupsController < ApplicationController
  def index
    matching_groups = Group.all

    @list_of_groups = matching_groups.order({ :created_at => :desc })

    render({ :template => "groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "groups/show.html.erb" })
  end

  def create
    the_group = Group.new
    the_group.title = params.fetch("query_title")
    the_group.group_creator_id = params.fetch("query_group_creator_id")

    if the_group.valid?
      the_group.save
      redirect_to("/groups", { :notice => "Group created successfully." })
    else
      redirect_to("/groups", { :notice => "Group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.title = params.fetch("query_title")
    the_group.group_creator_id = params.fetch("query_group_creator_id")

    if the_group.valid?
      the_group.save
      redirect_to("/groups/#{the_group.id}", { :notice => "Group updated successfully."} )
    else
      redirect_to("/groups/#{the_group.id}", { :alert => "Group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.destroy

    redirect_to("/groups", { :notice => "Group deleted successfully."} )
  end
end
