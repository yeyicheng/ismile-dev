class CreateJobs < ActiveRecord::Migration
	def change
		create_table :jobs do |t|
			t.string :title
			t.integer :category
			t.text :description
			t.integer :payment
			t.timestamps
		end
	end
end
