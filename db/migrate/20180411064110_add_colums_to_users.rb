class AddColumsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_img, :string
    add_column :users, :wallet_account_id, :string
    add_column :users, :wallet_account_password, :string
  end
end
