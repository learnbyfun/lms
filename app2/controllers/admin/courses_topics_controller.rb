class Admin::CoursesTopicsController < ApplicationController
	
	def index
		list
	end

	def list
		@course = Course.find(params[:id])
		@topics = Topic.all
		
	end

	def create
		
	end

	
end
