require 'rails_helper'

RSpec.describe Product do
  describe "create" do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('public/images/rails.png')
    end

    it "name,description,category_id,status_id,status_id,shipping_cost_id,prefecture_id,shipping_day_id,price,imageがあれば登録できること" do
      @product.valid?
      expect(@product).to be_valid
    end
    
    it "nameが空では登録できないこと" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "descriptionが空では登録できないこと" do
      @product.description = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    
    it "category_idが空では登録できないこと" do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category is not a number")
    end
    
    it "status_idが空では登録できないこと" do
      @product.status_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Status is not a number")
    end

    it "shipping_cost_idが空では登録できないこと" do
      @product.shipping_cost_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping cost is not a number")
    end

    it "prefecture_idが空では登録できないこと" do
      @product.prefecture_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture is not a number")
    end
    
    it "shipping_day_idが空では登録できないこと" do
      @product.shipping_day_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping day is not a number")
    end

    it "priceが空では登録できないこと" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "imageが空では登録できないこと" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image ファイルを添付してください")
    end

    it "priceが300未満では登録できないこと" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9,999,999より大きいと登録できないこと" do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    
    
    
    
  end
end
