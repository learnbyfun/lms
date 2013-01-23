class RequestsController < ApplicationController
	def index
		list
		render('list')
	end

	def list
		@requests = Request.joins(:user,:course)
	end

	  
  def update
  	course_id = params[:course_id]
    user_id = params[:user_id]
  	@course_requesed = Request.where("course_id = ? AND user_id = ?", course_id,user_id)
    if @course_requesed.count > 0
    	@course_requesed.update_all(:approve => true)
    	render :text => 'Status updated.', :content => 'text/html'
    end

  end
	
end
