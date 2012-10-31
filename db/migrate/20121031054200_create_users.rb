class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :email
			t.string :first_name
			t.string :last_name
			t.integer :gender
			t.integer :age
			t.string :enc_pwd
			t.integer :edu_level
			t.string :salt
			t.string :username
			
			t.timestamps
		end
		
		add_index :users, :email, :unique => true
	end
end
