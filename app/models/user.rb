class User < ActiveRecord::Base

	acts_as_messageable


	has_many :offers
	has_many :requests
	has_one :profile
	accepts_nested_attributes_for :profile


	enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable



	def mailboxer_email(option)
		email
	end

end
