class AddActionTypeStringToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :action_type, :string
  end
end
