class Gallery < ActiveRecord::Base

	has_many :pictures, :dependent => :destroy
	belongs_to :request
	belongs_to :profile

end
