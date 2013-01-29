class PagesController < ApplicationController
	def home
		@title = 'Home'
	end
	def contact
		@title = 'Contact Us'
	end
	def resume
		@title = 'Resume'
	end
	def intern
		@title = 'Intern'
	end
end
