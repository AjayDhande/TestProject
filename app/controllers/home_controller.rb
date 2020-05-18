class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token  
  def index
    @image = Image.new
  end

  def upload_image
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = I18n.t('success_messages.image_saved')
    else
      flash[:error] = @image.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  def game
    if request.get?
      @images = ActiveStorage::Attachment.where(record_type: "Image").map{|img| url_for(img) }
      @rounds = Play.all
    else
      play = Play.create(url: params[:url], counter: params[:counter])
      render json: { play: play }
    end
  end

  private
  def image_params
    params.require(:image).permit(image_file: [])
  end

end
