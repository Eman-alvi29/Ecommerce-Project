class AddInStockToItemSizes < ActiveRecord::Migration[7.2]
  def change
    add_column :item_sizes, :in_stock, :integer
  end
end
