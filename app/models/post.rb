class Post < ApplicationRecord
  mount_uploader :p_image, PImageUploader
end
