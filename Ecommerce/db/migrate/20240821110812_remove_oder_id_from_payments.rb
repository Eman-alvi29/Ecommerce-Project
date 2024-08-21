class RemoveOderIdFromPayments < ActiveRecord::Migration[7.2]
  def change
    remove_column :payments, :oder_id, :integer
  end
end
