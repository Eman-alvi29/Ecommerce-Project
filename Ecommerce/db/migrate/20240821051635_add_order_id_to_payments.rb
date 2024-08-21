class AddOrderIdToPayments < ActiveRecord::Migration[7.2]
 def change
   add_column :payments, :order_id, :integer
   add_index :payments, :order_id
   add_column :payments, :name, :string
   add_column :payments, :email, :string
   add_column :payments, :address, :string
   add_column :payments, :phone_number, :string
 end
end
