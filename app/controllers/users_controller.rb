class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")
    @the_user = User.where({ :username => url_username }).first
    render({ :template => "user_templates/show.html.erb" })
  end

  def create
  u = User.new
  u.username = params.fetch("input_user")
  u.save
  redirect_to("/users/" + u.username)
  end

  def edit
  userid = params.fetch("path_user")
  u = User.where({ :id => userid }).first
  u.username = params.fetch("input_username")
  u.save
  redirect_to("/users/" + u.username)
  end
end
