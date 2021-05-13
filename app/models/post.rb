class Post < ApplicationRecord
  mount_uploader :p_image, PImageUploader
  validates :user_id, {presence: true}
  validates :p_name, presence: true
  validates :p_adress, presence: true
  validates :p_image, presence: true
  validates :p_menseki, presence: true
  validates :p_price, presence: true
  validates :p_introduction, presence: true
  def user
    return User.find_by(id: self.user_id)
  end
end
