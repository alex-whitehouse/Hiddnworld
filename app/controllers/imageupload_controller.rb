class ImageuploadController < ApplicationController
  def index
    @imageupload = Imageupload.all
  end

  def new
    @imageupload = Imageupload.new
  end

  def create
    @imageupload = Imageupload.new(imageupload_params)
  
    if @imageupload.save
      redirect_to imageupload_path, notice: "Your image was uploaded."
  end
end


  def destroy
    @imageupload = Imageupload.find(params[:id])
    @imageupload.destroy
    redirect_to imageupload_path, notice "The image has been deleted."
  end

  private
  def imageupload_params
    params.require(:imageupload).permit(user_id:, :attachment)
end
