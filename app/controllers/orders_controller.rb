class OrdersController < ApplicationController
  before_action :set_product, only: [:index]
  def index
    
  end

  def create
    
  end
  
  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end
