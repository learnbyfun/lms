class Admin::TopicsController < ApplicationController
	def index
    list
    render('list')
  end
  
  def list
    @topics = Topic.all
  end
  
  
  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end
  
  def create
  	@topic = Topic.new(params[:topic])
    #@topic.file_type = params[:file_type]
    # Instantiate a new object using form parameters
    # Save the object
    if @topic.save
      flash[:notice] = "topic created."
      redirect_to(admin_topics_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    # Update the object
    if @topic.update_attributes(params[:topic])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Topic updated."
      redirect_to(admin_topics_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
  
  def delete
    @topic = Topic.find(params[:id])
  end
  
  def destroy
    Topic.find(params[:id])
    Topic.destroy(params[:id])
    flash[:notice] = "Topic destroyed."
    redirect_to(admin_topics_path)
  end

end
