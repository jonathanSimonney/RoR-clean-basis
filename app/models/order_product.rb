class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :order
  
  before_save :set_price
  after_save :update_order

  def set_price
    self.unit_price = product.price
    self.total_price = product.price * quantity
  end

  def update_order
    order.update_price
  end

end
