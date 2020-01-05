class ImageList < ApplicationRecord
  mount_uploader :image_path, ImageUploader
end