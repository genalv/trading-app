class AddAccountStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_status, :string, default: "Pending"
  end
end
