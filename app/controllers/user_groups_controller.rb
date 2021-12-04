class UserGroupsController < ApplicationController
  def index
    matching_user_groups = UserGroup.all

    @list_of_user_groups = matching_user_groups.order({ :created_at => :desc })

    render({ :template => "user_groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_groups = UserGroup.where({ :id => the_id })

    @the_user_group = matching_user_groups.at(0)

    render({ :template => "user_groups/show.html.erb" })
  end

  def create
    the_user_group = UserGroup.new
    the_user_group.user_id = params.fetch("query_user_id")
    the_user_group.group_id = params.fetch("query_group_id")
    the_user_group.approved = params.fetch("query_approved", false)

    if the_user_group.valid?
      the_user_group.save
      redirect_to("/user_groups", { :notice => "User group created successfully." })
    else
      redirect_to("/user_groups", { :notice => "User group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_group = UserGroup.where({ :id => the_id }).at(0)

    the_user_group.user_id = params.fetch("query_user_id")
    the_user_group.group_id = params.fetch("query_group_id")
    the_user_group.approved = params.fetch("query_approved", false)

    if the_user_group.valid?
      the_user_group.save
      redirect_to("/user_groups/#{the_user_group.id}", { :notice => "User group updated successfully."} )
    else
      redirect_to("/user_groups/#{the_user_group.id}", { :alert => "User group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_group = UserGroup.where({ :id => the_id }).at(0)

    the_user_group.destroy

    redirect_to("/user_groups", { :notice => "User group deleted successfully."} )
  end
end
