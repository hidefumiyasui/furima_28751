class ChangeTransactionsToOrder < ActiveRecord::Migration[6.0]
  def change
    rename_table :transactions, :order
  end
end
