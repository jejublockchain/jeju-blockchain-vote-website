class UserWalletsController < ApplicationController
  def create
		if params[:user_id].nil? || params[:wallet_account_id].nil? || params[:wallet_account_password].nil? 
			redirect_to root_path
		end
		
		@user = User.find(params[:user_id])
		@user.wallet_account_id = params[:wallet_account_id]
		@user.wallet_account_password = params[:wallet_account_password]
		
		if @user.save
      
    else
			redirect_to root_path
    end
  end
end
