class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefectures_id,:city,:block_number,:building_name,:phone_number,:token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを使用してください' }
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :city
    validates :block_number
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: 'ハイフンは不要' }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end