class DashboardController < ApplicationController
  def index
    # GoogleVision.detect_text(ActionController::Base.helpers.image_path('sign_text.png'))

    # GoogleVision.detect_text_gcs('gs://cloud-samples-data/vision/ocr/sign.jpg')
    @image_list = ImageList.all
  end

  def import_image

    if !params[:image_url].blank?
      @image_path = params[:image_url]
      @image_text_array = GoogleVision.detect_text_gcs(params[:image_url])

      image_file = ImageList.new
      image_file.remote_image_path_url = params[:image_url]
      image_file.text_data = @image_text_array.to_json
      image_file.save!
      @image_path = image_file.image_path
    elsif !params[:file].blank?
      
      File.open(params[:file].tempfile, 'rb') do |file|
        @image_text_array = GoogleVision.detect_text(file)
      end
      image_file = ImageList.new
      image_file.image_path = params[:file]
      image_file.image_name = params[:file].original_filename
      image_file.text_data = @image_text_array.to_json
      image_file.save!
      @image_path = image_file.image_path
    else
      
    end
    @image_list = ImageList.all
  end

  def show_selected_image
    image_file = ImageList.find_by(id: params[:id])

    unless image_file.blank?
      @image_path = image_file.image_path

      @image_text_array = JSON.parse(image_file.text_data)
    end
  end
end
