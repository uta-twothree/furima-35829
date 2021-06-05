class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Ship_charge
  belongs_to :Ship_from
  belongs_to :ship_days

  has_one_attached :image
  belongs_to :user
end
