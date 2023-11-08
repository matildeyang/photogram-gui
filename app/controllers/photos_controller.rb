class PhotosController < ApplicationController
  def index 
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index"})
  end 

  def show 
    photo_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => photo_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show"})
  end 

  def delete 
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy 

    redirect_to("/photos")

  end 

  def insert 
    input_image = params.fetch("image")
    input_caption = params.fetch("caption")
    input_owner_id = params.fetch("owner")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s )
  end 

  def update 
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where(:id => the_id)

    the_photo = matching_photos.at(0)

    input_image = params.fetch("image")
    input_caption = params.fetch("caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save 

    redirect_to("/photos/" + the_photo.id.to_s )
  end 

  def comment 
    the_image = params.fetch("photo_id")
    the_author = params.fetch("author_id")
    the_comment = params.fetch("comment")

    new_comment = Comment.new

    new_comment.photo_id = the_image
    new_comment.author_id = the_author
    new_comment.body = the_comment

    new_comment.save 

    redirect_to("/photos/" + the_image.to_s )

  end 
end 
