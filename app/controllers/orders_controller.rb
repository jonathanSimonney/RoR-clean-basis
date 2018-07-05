class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :pay, :update]

  def show
  end

  def edit

  end

  def pay

  end

  def update
    @order.process_payment(stripe_params[:stripeToken], stripe_params[:stripeEmail])
    @order.save
    redirect_to @order, notice: 'Order was successfully paid.'
  end

  private
    def set_order
      @order= current_user.orders.find_by(id: params[:id], paid: false)
    end

  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end
end
