class AddAreaToJob < ActiveRecord::Migration
  def change
	add_column :jobs, :area, :integer
  end
end
