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
end 
