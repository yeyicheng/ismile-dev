class Job < ActiveRecord::Base
	attr_accessible :category, :description, :title, :area
	validates :title, :category, :description, :area, :presence => true
end
