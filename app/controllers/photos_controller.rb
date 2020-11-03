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

  def delete
  url_photoid = params.fetch("path_photoid")
  the_photo = Photo.where({ :id => url_photoid }).first
  the_photo.destroy
  redirect_to("/photos")
  end

  def create
  p = Photo.new
  p.image = params.fetch("input_image")
  p.caption = params.fetch("input_caption")
  p.owner_id = params.fetch("input_owner_id")
  p.save
  redirect_to("/photos/" + p.id.to_s)
  end

  def update
  photoid = params.fetch("path_photoid")
  c = Photo.where({ :id => photoid }).first
  c.image = params.fetch("input_image")
  c.caption = params.fetch("input_caption")
  c.save
  redirect_to("/photos/" + c.id.to_s)
  end

end
