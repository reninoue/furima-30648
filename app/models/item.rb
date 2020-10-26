class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time



  belongs_to :user
  has_one_attached :image
  has_one :purchase
  
  validates :user, presence:true
  validates :name, presence:true, length: { maximum: 40 }
  validates :description, presence:true, length: { maximum: 1000 }
  validates :category_id, presence:true, numericality: { other_than: 1 }
  validates :condition_id, presence:true, numericality: { other_than: 1 }
  validates :postage_payer_id , presence:true, numericality: { other_than: 1 }
  validates :prefecture_id, presence:true, numericality: { other_than: 0 }
  validates :handling_time_id, presence:true, numericality: { other_than: 1 }
  validates :price, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  

end
