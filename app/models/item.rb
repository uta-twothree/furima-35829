class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_charge
  belongs_to :ship_from
  belongs_to :ship_days

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1, message: 'cannnot be blank' } do
      validates :category_id
      validates :condition_id
      validates :ship_charge_id
      validates :ship_from_id
      validates :ship_days_id
    end
  end

  with_options presence: true, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price
  end

  validates_inclusion_of :price, { in: 300..9_999_999, message: 'is out of setting range' }
end
