class Request < ActiveRecord::Base

	belongs_to :user
	has_one :gallery
	validates_presence_of :gallery
	has_many :pictures, through: :gallery


	# validates_attachment_presence :photo
	# validates_attachment_size :photo, :less_than => 5.megabytes
	# validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def self.search(query)
		where("title like ?", "%#{query}%")
	end

end
