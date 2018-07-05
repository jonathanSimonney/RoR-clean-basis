class OrderProductsController < ApplicationController

  def create
    @order_product = current_user.order_products.find_or_initialize_by(order_product_params)
    set_quantity
    set_order
    redirect_to @order_product if @order_product.save!
  end

  def show
    @order_product = OrderProduct.find_by(id: params[:id])
  end

  private

    def set_quantity
      @order_product.quantity = @order_product.persisted? ? @order_product.quantity + 1 : 1
    end

    def set_order
      current_order = current_user.orders.find_by(paid: false)
      unless current_order.present?
        current_order = @order_product.build_order
        current_order.save!
      end
      @order_product.order = current_order
    end

    def order_product_params
      params.require(:order_product).permit(:product_id)
    end


end
