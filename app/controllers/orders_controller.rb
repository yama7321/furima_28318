class OrdersController < ApplicationController
  before_action :set_product, only: [:index]
  def index
    
  end

  def create
    order_params
    @order = Order.new(user_id: current_user.id, product_id: params[:product_id])
    if @order.valid?
      pay_item
      @order.product.sold_out = true
      @order.product.save
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :product_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.product.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  
  
end
