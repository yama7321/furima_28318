class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validate :image_presence

  def image_presence
    if image.attached?
      errors.add(:image, 'にはjpegまたはpngファイルを添付してください') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id
  end
end
