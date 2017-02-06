class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
	end

  def new
  	@order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
    	flash[:success] = "Create a new order successfully."
    	redirect_to @order
    else
    	render 'new'
    end
  end

  def edit
  	@order = Order.find(params[:id]) 	
  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update_attributes(order_params)
  		flash[:success] = "Order updated"
  		redirect_to @order
  	else
  		render 'edit'
  	end
  end

  private
  	def order_params
      params.require(:order).permit(:InternationalShippingFee, 
      	:DomesticShippingFee, :ExchangeRate, :Price, 
      	:From, :Status, :Refund, :CompletedDate)
    end
end
