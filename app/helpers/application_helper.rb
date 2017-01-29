module ApplicationHelperq
	def full_title(page_title = '')
		base_title = "美國代購by娜塔莉"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
end
