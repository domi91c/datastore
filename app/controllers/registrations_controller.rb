class RegistrationsController < Devise::RegistrationsController

	def create
		super
		@profile = Profile.new
		@profile.save
		resource.profile = @profile
	end
end