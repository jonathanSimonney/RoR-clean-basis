class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  def update_price
    total_price = order_products.sum(:total_price)
    update(price: total_price)
  end

  def process_payment(token, email)
    customer = Stripe::Customer.create email: email,
                                       card: token

    Stripe::Charge.create customer: customer.id,
                          amount: (price * 100).to_i,
                          description: 'Produit',
                          currency: 'eur'

  end
end
