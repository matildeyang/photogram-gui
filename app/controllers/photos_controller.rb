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
end 
