class Student < ApplicationRecord
	#validates :name, presence: true
	#validates :name, presence: { message: "must be given please" }
	#validates :name, allow_blank:false
	 validates :name, length: { minimum: 10 }


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



	validates :phone ,  length:{ is: 10}, numericality: { only_integer: true }
	#validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , length:{ is: 10},:message => "Only positive number without spaces are allowed"

	validates :address, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }
end
