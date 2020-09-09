class RenameTransactionIdColumnToDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :transaction_id, :order_id
  end
end
