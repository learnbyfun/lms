class RequestsController < ApplicationController
	def index
		list
		render('list')
	end

	def list
		@requests = Request.all
		@user = User.find(:all)
		@courses = Course.find(:all)
	end

end
