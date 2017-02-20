class Order < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(updated_at: :desc) }
  validates :user_id, presence: true

	FACEBOOK = 'Facebook'
	PTT = 'PTT'
	SHOPEE = 'Shopee'
	ORDERED = 'Ordered'
	ARRIVED_US = 'Arrived US'
	SHIPPED = 'Shipped'
	WAIT_CONFIRMED = 'Wait Confirmed'
	COMPLETED = 'Completed'
	UNKNOWN = 'Unknown'

	def self.able_to_calculate_revenue(order)
		if(order.cost == nil || order.price == nil || 
			order.international_shipping_fee == nil || 
			order.domestic_shipping_fee == nil || 
			order.exchange_rate == nil )
			false
		else
			true
		end
	end

	def self.calculate_revenue(order)
		(order.price - (order.cost + order.international_shipping_fee)*order.exchange_rate - order.domestic_shipping_fee)
	end

	def self.description_to_from(from)
		case from
			when FACEBOOK
				1
			when PTT
				2
			when SHOPEE
				3
			else
				0
			end
	end

	def self.from_to_description(from)
		case from
			when 1
				FACEBOOK
			when 2
				PTT
			when 3
				SHOP_EE
			else
				UNKNOWN
			end
	end	

	def self.description_to_order_status(status)
		case status
			when ORDERED
				1
			when ARRIVED_US
				2
			when SHIPPED
				3
			when WAIT_CONFIRMED
				4
			when COMPLETED
				5
			else
				0
			end
	end

	def self.order_status_to_description(status)
		case status
			when 1
				ORDERED
			when 2
				ARRIVED_US
			when 3
				SHIPPED
			when 4
				WAIT_CONFIRMED
			when 5
				COMPLETED
			else
				UNKNOWN
			end
	end	
end
