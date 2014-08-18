class OrdersController < ApplicationController

  def index
    @orders=Order.all
    @order=Order.new
  end

  def new
    @order=Order.new
  end






  
end
