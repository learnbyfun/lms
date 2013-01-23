class CoursesController < ApplicationController
	before_filter :authenticate_user!

	def index
		#authorize! :index, @user, :message => 'Not authorized.'
		list
    	render('list')
	end
		
	def list
	   @courses = Course.all
	   @topics = Topic.find(:all)
	end	

	def req
		@user_id = current_user.id
		@course_id = params[:id]
		@course = Course.count(@course_id)
		if @course > 0
			@request = Request.new(:course_id => @course, :user_id => @user_id)
			respond_to do |format|  
		      	if @request.save  
		      			flash[:notice] = "Request Created."
		       		    format.json  { render :json => @request }
		        end 
	      	end  
		end
	end

	def request_list
		@request = Request.all
	end
 end

 	



