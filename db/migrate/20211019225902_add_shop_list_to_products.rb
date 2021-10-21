class AddShopListToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :shop_list, null: false, foreign_key: true
  end
end
