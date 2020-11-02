require 'rails_helper'

describe UserPurchase do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '商品購入機能' do
    context '新規登録がうまくいくとき' do
    it '購入が正常に完了する' do
      expect(@user_purchase).to be_valid
    end
  end


    context '商品購入がうまくいかないとき' do
      it '郵便番号が必須である' do
        @user_purchase.post_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code can't be blank")
      end
  
      it '郵便番号にはハイフンが必要であること' do
        @user_purchase.post_code = '15000072'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code ハイフンを使用してください")
      end
  
      it '都道府県が必須である' do
        @user_purchase.prefectures_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefectures can't be blank")
      end
      
      it '都道府県の--が選択されている場合に購入ができない' do
        @user_purchase.prefectures_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefectures must be other than 0')
      end
  
      it '市区町村が必須である' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
  
      it '番地が必須である' do
        @user_purchase.block_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Block number can't be blank")
      end
  
      it '電話番号が必須である' do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @user_purchase.phone_number = '090-7777-7777'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)", "Phone number ハイフンは不要")
      end

      it '電話番号が11桁以上であった時' do
        @user_purchase.phone_number = '090222233334444'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "tokenが空では購入できないこと" do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end