class OrdersController < ApplicationController

	def index
		@orders = Order.paginate(page: params[:page])
	end

	def show
		@order = Order.find(params[:id])
	end

  def new
  	@order = Order.new
    @user = User.new
  end

  def destroy
  	Order.find(params[:id]).destroy
  	flash[:success] = "Order deleted"
  	redirect_to orders_url
  end

  def create
    @user = User.find_by(login: user_params[:login])
    @order = Order.new

    # create a new user if not exists.
    if !@user 
    	@user = User.new(user_params)    	
    	if !@user.save        
    		render 'new'
        return 
    	end
    end

    # associate an order with user
    @order = @user.orders.create(order_params)
    if @order.save
    	flash[:success] = "Create a new order successfully."
    	redirect_to @order
    else
    	render 'new'
    end

  end

  def edit
  	@order = Order.find(params[:id]) 	
    @user = @order.user
  end

  def update
  	@order = Order.find(params[:id])
    @user = @order.user
  	if (@order.update_attributes(order_params) && @user.update_attributes(user_params))
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
      	:From, :Status, :Refund, :CompletedDate, :CustomerFirstName,
      	:CustomerLastName, :CustomerPhone, :CustomerAddress, :Brand,
      	:Cost, :Description)
    end

    def user_params
    	params.require(:user).permit(:login, :email)
    end
end
