class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.order("id DESC").page(params[:page]).per(5)
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
    @order = current_user.orders.build(order_params)

    if @order.save   
      if car = @order.book_car!
        flash[:notice]='稍後計程車就會抵達'
      else
        flash[:notice]='目前沒有計程車'
      end

      redirect_to orders_path
    else
      # render error form
      render :new
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    
    if car = @order.car
      car.status = "available"
      car.save
    end

    @order.destroy

    redirect_to orders_path
  end


  private

  def order_params
    params.require(:order).permit(:pickup_location,:destination,:tel,:recipient,:recipient_tel,:email, :content)
  end
  
end
