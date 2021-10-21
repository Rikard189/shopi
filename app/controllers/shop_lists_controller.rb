class ShopListsController < ApplicationController
  before_action :set_shop_list, only: [:update, :destroy]

  def index
    @shop_lists = ShopList.all
    render json: @shop_lists
  end

  def create
    @shop_list = ShopList.new(shop_list_params)
    if @shop_list.save
      render json: @shop_list
    else
      render json: @shop_list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shop_list.destroy
    render json: {status: "Shop List named '#{@shop_list.name}' succesfully deleted"}
  end

  def update
    if @shop_list.update(shop_list_params)
      render json: @shop_list
    else
      render json: @shop_list.errors, status: :unprocessable_entity
    end
  end

  private

  def set_shop_list
    @shop_list = ShopList.find(params[:id])
  end

  def shop_list_params
    params.require(:shop_list).permit(:name)
  end
end
