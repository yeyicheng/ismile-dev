class User < ActiveRecord::Base
	attr_accessible :age, :edu_level, :email, :enc_pwd, :first_name, :gender,
	:last_name, :salt, :pwd, :pwd_confirm, :username, :admin
	attr_reader :pwd
	attr_accessor :pwd_confirm
	
	validates :username, presence: true, length: {minimum: 6, maximum: 20}
	validates :email, presence: true, uniqueness: {case_sensitive: false} 
	validates :first_name, :last_name, :gender, :age, :edu_level, :enc_pwd, :salt, presence: true
	validates :pwd, confirmation: true, length: {minimum: 6, maximum: 20}
	
	def pwd=(pawd)
		@pwd = pawd

		if pwd.present?
			g_salt if new_record?
			self.enc_pwd = User.encrypt_pwd(pawd, salt)
		end
	end

	def User.authenticate(email, pawd)
		if user = find_by_email(email)
			if user.enc_pwd == encrypt_pwd(pawd, user.salt)
				user
			end
		end
	end                                       

	private
		def pwd_must_exist
			error.add(:pwd, 'Missing password!') unless enc_pwd.present?
		end

		def g_salt
			self.salt = "#{self.id}--#{rand}--#{Time.now}"
		end
		
		def User.encrypt_pwd(pwd, salt)
			Digest::SHA2.hexdigest(pwd + '--' + salt)
		end
end
