class User < ApplicationRecord
	
	has_secure_password

	before_save { |user| user.username = username.downcase }
	# has many relation with pins
	has_many :pins, :dependent => :destroy

	validates :name, presence: true, length: { maximum: 50 }
	validates_uniqueness_of :username, :case_sensitive => false

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	valides :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }


	validates :password, presence: true,
			  length: {minimum: 1}

  	validates :password_confirmation, presence: true

	accepts_nested_attributes_for :pins
end
