class OrdersController < ApplicationController

  def index

    @order=Order.new
  end

  def new
    @order = Order.new
    @cars_hash = Car.all.map { |c|
      {
        "lat" => c.latitude,
        "lng" => c.longitude,
        "infowindow" => c.name
      }
    }
  end

  def create
    @order = Order.new(order_params)
    if @order.save   
      if car = @order.book_car!
        flash[:notise]='稍後計程車就會抵達'
        redirect_to new_order_path
      else
        flash[:notice]='目前沒有計程車'
      end

    else
      # render error form
      render :new
    end
  end

  def show
    @order=current_user.order.find(params[:order])
    @users=@order.users
  end

  

  private

  def order_params
    params.require(:order).permit(:pickup_location,:destination,:tel,:recipient,:recipient_tel,:email, :content)
  end
  
end
