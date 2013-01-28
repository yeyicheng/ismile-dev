class Job < ActiveRecord::Base
  attr_accessible :category, :description, :title
end
