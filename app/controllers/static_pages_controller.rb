class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    @flickr = Flickr.new

    @photos = if params[:flickr_id].blank?
                @flickr.photos.getRecent
              else
                @flickr.photos.search user_id: params[:flickr_id]
              end
  end
end
