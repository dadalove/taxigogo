class SessionsController < ApplicationController

  def create
    Rails.logger.debug("-------test---------")
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice]='Hi,你已經成功登入'
    #redirect_to root_path
    redirect_to new_order_path
  end

  def failure
    if params[:error]
    flash[:alert]='你未授權進入'
    redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end





end
