class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :not_selling_user?, only: [:index, :create]
  before_action :is_sold_out, only: [:index]
  def index
  end

  def create
    @order = ProductOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save_in
      @product.sold_out = true
      @product.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number,
                  :building_number, :phone_number, :product_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def not_selling_user?
    redirect_to root_path if current_user == @product.user
  end

  def is_sold_out
    redirect_to root_path if @product.sold_out == true
  end
end
