require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("spec/factories/image/sample.jpg")
  end

  describe '商品出品機能' do
    it '出品が正常に完了する' do
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須である' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須である' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須である' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須である' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの--が選択されている場合に出品ができない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須である' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '商品の--が選択されている場合に出品ができない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料の負担についての情報が必須である' do
      @item.postage_payer_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end
    it '配送料の--が選択されている場合に出品ができない' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
    end
    it '発送元の地域についての情報が必須である' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送元の地域の--が選択されている場合に出品ができない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '発送までの日数についての情報が必須である' do
      @item.handling_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Handling time can't be blank")
    end
    it '発送までの日数の--が選択されている場合に出品ができない' do
      @item.handling_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Handling time must be other than 1")
    end
    it '価格についての情報が必須である' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300以上である' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が¥10,000,000以下である' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字のみ保存可能である' do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
