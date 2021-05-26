class Post < ApplicationRecord
  has_many :reservations
  mount_uploader :p_image, PImageUploader
  validates :user_id, { presence: true }
  validates :p_name, presence: true
  validates :p_adress, presence: true
  validates :p_menseki, presence: true
  validates :p_price, presence: true
  validates :p_introduction, presence: true
  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    return Post.all unless search

    Post.where(['p_name LIKE ? OR p_adress LIKE ?', "%#{search}%", "%#{search}%"])
  end
end
