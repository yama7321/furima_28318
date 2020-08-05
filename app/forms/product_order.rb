class ProductOrder
  include ActiveModel::Model
  attr_accessor :product_id, :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token, length: { minimum: 10, message: 'is invalid' }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save_in
    Order.create(user_id: user_id, product_id: product_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                       building_number: building_number, phone_number: phone_number, product_id: product_id)
  end
end
