class UsersController < ApplicationController
  def index 
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index"})
  end 

  def show 
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first 

    if @the_user == nil 
      redirect_to("/404")
    else 
      render({ :template => "user_templates/show"})
    end 
  end 

  def add 
    input_username = params.fetch("username")

    new_user = User.new 
    new_user.username = input_username

    new_user.save

    redirect_to("/users/" + new_user.username, allow_other_host: true )
  end 

  def update 
    old_username = params.fetch("username")
    matching_users = User.where(:username => old_username)

    the_user = matching_users.at(0)

    input_username = params.fetch("new_username")

    the_user.username = input_username

    the_user.save 

    redirect_to("/photos/" + the_user.username.to_s, allow_other_host: true)
  end 
end 
