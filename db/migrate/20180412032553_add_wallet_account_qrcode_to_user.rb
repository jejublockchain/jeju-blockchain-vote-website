class AddWalletAccountQrcodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallet_account_qrcode_data, :text
  end
end
