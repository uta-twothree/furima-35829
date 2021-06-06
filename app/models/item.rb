class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Ship_charge
  belongs_to :Ship_from
  belongs_to :ship_days

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition
      validates :ship_charge_id
      validates :ship_from_id
      validates :ship_days_id
    end
  end

  with_options presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

end
