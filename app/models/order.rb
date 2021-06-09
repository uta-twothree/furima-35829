class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_from_id

  belongs_to :user
  belongs_to :item
  has_one :address
end
