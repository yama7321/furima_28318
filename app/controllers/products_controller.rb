class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end
  

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :user, :sold_out).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
