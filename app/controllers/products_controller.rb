class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    # @product = Product.where(id: params[:id]).first
    @product = Product.find_by(id: params[:id])
  end

end
