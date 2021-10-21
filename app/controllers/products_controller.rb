class ProductsController < ApplicationController
  before_action :set_shop_list
  before_action :set_product, only: [:update, :destroy]

  def index
    @products = @shop_list.products
    render json: @products
  end

  def create
    @product = @shop_list.products.new(product_params)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: {status: "Product named '#{@product.name}' succesfully deleted"}
  end

  private

  def set_shop_list
    @shop_list = ShopList.find(params[:shop_list_id])
  end

  def set_product
    @product = @shop_list.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :photo, :purchased, :category, :shop_list_id
    )
  end
end
