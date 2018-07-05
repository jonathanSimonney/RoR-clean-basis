class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  def update_price
    total_price = order_products.sum(:total_price)
    update(price: total_price)
  end

end
