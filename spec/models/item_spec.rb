require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
    end

    describe "商品新規登録" do
      context "商品が登録できる場合" do
        
        it "image, name, info, category_id, sales_status_id, shipping_fee_status_id, prefecture_id, scheduled_delivery_id,priceが入力されていれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context "商品登録ができない場合" do
        
        it "imageが空では登録できない" do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank") 
        end

        it "nameが空では登録できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "category_idが1では登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "sales_status_idが1では登録できない" do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include ("Sales status must be other than 1")
        end

        it "shipping_fee_status_idが1では登録できない" do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
        end

        it "prefecture_idが1では登録できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "scheduled_delivery_idが1では登録できない" do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
        end

        it "priceが空では登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが数値でなければ登録できない" do
          @item.price = "aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceが300未満では登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end

        it "priceが9999999より大きいと登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end
      end
    end
  end
end
