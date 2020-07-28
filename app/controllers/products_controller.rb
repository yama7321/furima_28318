class ProductsController < ApplicationController
  def index
  end


  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :category, :status, :shipping_cost, :prefecture_id, :shipping_days, :price, :user, :sold_out).merge(user_id: current_user.id)
  end
end
