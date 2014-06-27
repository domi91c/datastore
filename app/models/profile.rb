class Profile < ActiveRecord::Base

	belongs_to :user
	has_one :location
	has_one :gallery
	validates_presence_of :gallery
	has_many :pictures, through: :gallery

end
