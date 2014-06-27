class MessagesController < ApplicationController

	# GET /message/new
	def new
		@request = Request.find(params[:request])
		@message = current_user.messages.new
		@user = @request.user
	end

	def reply
		@conversation ||= current_user.mailbox.conversations.find(params[:id])
	end

	# POST /message/create
	def create
		@user = User.find(params[:user])
		@body = params[:body]
		@subject = params[:subject]
		current_user.send_message(@user, params[:body], params[:subject])
		flash[:notice] = "Message has been sent!"
		redirect_to :conversations
	end
end