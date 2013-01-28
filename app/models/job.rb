class Job < ActiveRecord::Base
	attr_accessible :category, :description, :title
	validates :title, :category, :description, :presence => true
end
