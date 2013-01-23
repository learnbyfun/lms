class Admin::CoursesController < ApplicationController

   def index
    list
    render('list')
  end
  
  def list
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id])
  end

   
  def new
    @course = Course.new
    @topics = Topic.find(:all)
   end
  
  def create
    @parent_course = Course.find(params[:course][:parent_id])
    @child_course = Course.create!(:name => params[:course][:name])
    @topic = Topic.find(:all)
    # Instantiate a new object using form parameters
    # Save the object
    if @child_course.move_to_child_of(@parent_course)
     @child_course.topic_ids = params[:course][:topic_ids]
      @child_course.save
      flash[:notice] = "course created."
      redirect_to(admin_courses_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
    @course = Course.find(params[:id])
    @topics = Topic.find(:all)
    
  end
  
  def update
    params[:course][:topic_ids] ||= {}
    @course = Course.find(params[:id])
    @topic = Topic.find(:all)
      if @course.update_attributes(params[:course])
              flash[:notice] = 'Course was successfully updated.'
              redirect_to(admin_courses_path)
      else
        render('edit')
      end
  end
  

  def delete
    @course = Course.find(params[:id])
    
  end
  
  def destroy

    Course.find(params[:id])
    Course.destroy(params[:id])
    flash[:notice] = "Course destroyed."
    #Course.rebuild!
    redirect_to(admin_courses_path)
  end  
 end
