class RenamePurchaseIdColumnToTransactionId < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :purchase_id, :transaction_id
  end
end
