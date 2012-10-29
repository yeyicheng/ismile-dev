module ApplicationHelper
	def page_title
		base = "iSmile Consulting"
		if @title
			base + ' | ' + @title
		else
			base
		end
	end
end
