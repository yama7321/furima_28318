require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  describe "購入情報の保存" do
    before do
      @product_order = FactoryBot.build(:product_order)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@product_order).to  be_valid
    end
    
    it "postal_codeが空だと保存できないこと" do
      @product_order.postal_code = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Postal code can't be blank")
    end
    
    it "postal_codeの形式がxxx-xxxxでなければならないこと" do
      @product_order.postal_code = "1234567"
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Postal code is invalid")
    end
    
    it "cityが空だと登録できないこと" do
      @product_order.city = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("City can't be blank")
    end
    
    it "house_numberが空だと登録できないこと" do
      @product_order.house_number = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("House number can't be blank")
    end
    
    it "phone_numberが空だと登録できないこと" do
      @product_order.phone_number = nil
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Phone number can't be blank")
    end
    
    it "phone_numberが全角文字では登録できないこと" do
      @product_order.phone_number = "０００００００００００"
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Phone number is invalid")
    end
    
    it "phone_numberが9桁以下では登録できないこと" do
      @product_order.phone_number = "123456789"
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Phone number is invalid")
    end

    it "phone_numberが12桁以上では登録できないこと" do
      @product_order.phone_number = "123456789012"
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Phone number is invalid")
    end

    it "prefecture_idが1では登録できないこと" do
      # 1 は選択肢の {---}
      @product_order.prefecture_id = 1
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Prefecture must be other than 1")
    end

    it "tokenがfalseでは登録できないこと" do
      # card.js にて、トークン化に失敗した場合falseをサーバーに送信する旨を記述。
      @product_order.token = false
      @product_order.valid?
      expect(@product_order.errors.full_messages).to  include("Token is invalid")
    end
      
    
    
    
  end
  
end
