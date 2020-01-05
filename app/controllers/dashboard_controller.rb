class DashboardController < ApplicationController
  def index
    # GoogleVision.detect_text(ActionController::Base.helpers.image_path('sign_text.png'))

    # GoogleVision.detect_text_gcs('gs://cloud-samples-data/vision/ocr/sign.jpg')
  end

  def import_image

    if !params[:image_url].blank?
      @image_path = params[:image_url]
      @image_text_array = GoogleVision.detect_text_gcs(params[:image_url])
    elsif !params[:file].blank?
      
      File.open(params[:file].tempfile, 'rb') do |file|
        @image_text_array = GoogleVision.detect_text(file)
      end
      @image_path = ''
    else
      
    end
  end
end
