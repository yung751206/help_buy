class Order < ActiveRecord::Base
	FACEBOOK = 'Facebook'
	PTT = 'PTT'
	SHOP_EE = 'Shopee'
	def self.description_to_from(from)
		case from
			when "Facebook"
				1
			when "PTT"
				2
			when "Shopee"
				3
			else
				0
			end
	end
end
