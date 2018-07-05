class OrdersController < ApplicationController
  def show
    @order= current_user.orders.find_by(id: params[:id])
  end

  def edit
    @order= current_user.orders.find_by(id: params[:id], paid: false)
  end
end
