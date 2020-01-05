class DashboardController < ApplicationController
  def index
    # GoogleVision.detect_text(ActionController::Base.helpers.image_path('sign_text.png'))

    GoogleVision.detect_text_gcs('gs://cloud-samples-data/vision/ocr/sign.jpg')
  end
end
