class PhotosController < ApplicationController

  def index
  matching_photos = Photo.all.order({:created_at => :desc})
  @list_of_photos = matching_photos
  render({ :template => "photo_templates/index.html.erb"})
  end

  def show
  url_photoid = params.fetch("path_photoid")
  @the_photo = Photo.where({ :id => url_photoid }).first
  render({ :template => "photo_templates/show.html.erb"})
  end

end
