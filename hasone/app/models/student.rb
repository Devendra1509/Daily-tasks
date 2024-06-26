class Student < ApplicationRecord
	#validates :name, presence: true
	#validates :name, presence: { message: "must be given please" }
	#validates :name, allow_blank:false
	 #validates :name, length: { minimum: 10 }
	 validates :name, format: { with: /\A\w{6,10}\z/ }


	#validates :email, confirmation: { case_sensitive: false }
	#validates :email ,uniqueness: true
	#validates :email, format: URI::MailTo::EMAIL_REGEXP

		 validates :email,
		 format: URI::MailTo::EMAIL_REGEXP,
           uniqueness: {
            message: ->(object, data) do
            "Hey #{object.name}, #{data[:value]} is already taken."
          end
    }


    PHONE_REGEX = /\A\(\d{3}\)\d{3}-\d{4}\z/
    validates :phone, format: { with: PHONE_REGEX }
	#validates :phone ,  length:{ is: 10}, numericality: { only_integer: true }
	#validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , length:{ is: 10},:message => "Only positive number without spaces are allowed"

	validates :address, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }


    validates :gender ,inclusion: {in: %w(male female), message:"%{value} is not valid "}

    validates :gender ,exclusion: { in: %w(male female), message:"%{value} is not valid "}# not allow this two 
 
end
