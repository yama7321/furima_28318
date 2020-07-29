class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id,:shipping_cost_id, :prefecture_id,:shipping_day_id
  end

  
  
end
