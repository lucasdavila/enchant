require 'net/http/post/multipart'

class ChantsController < ApplicationController
  before_filter :authenticate_user!, :only => :upload

  def index
    @album_shortcut = Chute::V2::Albums.find(album_id).data.shortcut
  end

  def upload
    if params[:chant]
      file = write_and_open_file params[:chant][:video]
      chant = Chute::V2::Assets.upload album_id, file
      Chute::V2::Assets.update chant.data.first.id, { :username => current_user.name.to_s.delete(' ') }
    end

    redirect_to :action => :index
  end

  private

  def write_and_open_file uploaded_file
    filename = SecureRandom.hex + uploaded_file.original_filename

    UploadIO.new uploaded_file.tempfile, 'video/mp4', filename
  end

  def album_id
    ENV['CHUTE_ALBUM_ID']
  end
end
