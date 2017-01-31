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

  private
  	def order_params
      params.require(:order).permit(:InternationalShippingFee, 
      	:DomesticShippingFee, :ExchangeRate, :Price, 
      	:From, :Status, :Refund, :CompletedDate)
    end
end
