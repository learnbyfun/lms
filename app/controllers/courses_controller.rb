class CoursesController < ApplicationController
	before_filter :authenticate_user!

	def index
		#authorize! :index, @user, :message => 'Not authorized.'
		list
    	render('list')
	end
		
	def list
	   @courses = Course.all

	end	

	def cancel
		@user_id = current_user.id
		@course_id = params[:id]
		#@course = Course.count(@course_id) #does course exiss
		render :text => 'dfdsff' + @user_id.to_s, :content_type => 'text/html'
	end

	def request_handler		
		act_str = params[:act]
		if(act_str =='Request')
			request_course
		else
			cancel_course
		end	
	end

	private 

	def request_course
		course_id = params[:id]
		user_id = current_user.id
		#@course = Course.count(@course_id) #does course exiss
		@course_requesed = Request.where("course_id = ? AND user_id = ?", course_id,user_id)
		if @course_requesed.count == 0
			@request = Request.new(:course_id => course_id, :user_id => user_id)			
		    if @request.save  
		    	txt_message = 'Requested'
		    else
		    	txt_message = "Error"
		    end 
	    else
	    	txt_message = "Error"
	    end
	    render :text => txt_message, :content_type => 'text/html'
	end
	
	def cancel_course
		course_id = params[:id]
		user_id = current_user.id
		#@course = Course.count(@course_id) #does course exiss
		@course_requesed = Request.where("course_id = ? AND user_id = ?", course_id,user_id)
		if @course_requesed.count > 0
			@course_requesed.destroy_all
    		render :text => "Canceled", :content_type => 'text/html'
    	else
    		render :text => "Error", :content_type => 'text/html'	
    	end 
	end	
end
 	



