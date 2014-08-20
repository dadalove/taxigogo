class AuthsController < ApplicationController
  def create
    # session[:current_user_id] = User.get_by_auth_hash(auth_hash)
    if  params[:code]
    flash[:notice]='你已經成功登入'
    redirect_to new_order_path
    end
  end

  def failure
    if params[:error]
    flash[:alert]='你未授權進入'
    redirect_to root_path
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  
end
