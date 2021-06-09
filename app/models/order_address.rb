class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :ship_from_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :ship_from_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is too short", with: /\A[0-9]+\z/, message: "is invalid. Input only number"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    address = Address.create(postcode: postcode, ship_from_id: ship_from_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end