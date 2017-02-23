class OrdersController < ApplicationController
  helper_method :sort_column, :sort_direction

	def index
    if(sort_column == "login")
      @orders = Order.includes(:user).search(params[:search]).order("users.login " + sort_direction).paginate(per_page: 15, page: params[:page])
    else
  		@orders = Order.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 15, page: params[:page])
    end
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
    else
      update_hash = check_update_hash(params[:user])
      if !@user.update_attributes(update_hash)
        render 'new'
        return
      end
    end

    # associate an order with user
    @order = @user.orders.create(order_params)
    if Order.able_to_calculate_revenue @order
      @order.revenue = Order.calculate_revenue(@order)
    end

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

    if Order.able_to_calculate_revenue params[:order]
      params[:order][:revenue] = Order.calculate_revenue(params[:order]).to_s
    end

  	if (@order.update_attributes(order_params) && @user.update_attributes(user_params))
  		flash[:success] = "Order updated"
  		redirect_to @order
  	else
  		render 'edit'
  	end
  end

  private
  	def order_params
      params.require(:order).permit(:international_shipping_fee, 
      	:domestic_shipping_fee, :exchange_rate, :price, 
      	:origin, :status, :refund, :completed_date,
      	:brand, :cost, :description, :revenue)
    end

    def user_params
    	params.require(:user).permit(:login, :email, :customer_address,
        :customer_phone, :customer_first_name, :customer_last_name)
    end

    def check_update_hash(user_params)
      result = {}
      result[:customer_first_name] = user_params[:customer_first_name] if user_params[:customer_first_name].present?
      result[:customer_last_name] = user_params[:customer_last_name] if user_params[:customer_last_name].present?
      result[:customer_address] = user_params[:customer_address] if user_params[:customer_address].present?
      result[:customer_phone] = user_params[:customer_phone] if user_params[:customer_phone].present?
      return result
    end

    def sort_column
      Order.column_names.include?(params[:sort]) || User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end     
end
