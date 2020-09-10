class ChangePurchasesToTransactions < ActiveRecord::Migration[6.0]
  def change
    rename_table :purchases, :transactions
  end
end
