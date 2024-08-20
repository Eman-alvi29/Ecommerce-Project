class AddStockQuantityToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :stock_quantity, :integer
  end
end
