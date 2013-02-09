class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  skip_before_filter :authorize, only: [:select, :show]
  def select
    @courses = Course.find_all_by_faculty_id(params[:faculty])
    @courses = @courses.sort_by(&:num)
    respond_to do |format|
      format.js
      format.json { render json: @courses }
    end
  end

  def show
    @course = Course.find(params[:id])
    @groups = Group.find_all_by_course_id(@course.id)
    @groups = @groups.sort_by(&:name)
    respond_to do |format|
      format.xml
      format.json { render json: @course }
    end
  end
  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
