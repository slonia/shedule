class FacultiesController < ApplicationController
  # GET /faculties
  # GET /faculties.json
  skip_before_filter :authorize, only: [:select, :show]
  def select
    @faculties = Faculty.find_all_by_university_id(params[:university])
    @faculties = @faculties.sort_by(&:name)
    respond_to do |format|
      format.html # select.html.erb
      format.js
      format.json { render json: @faculties }
    end
  end
  # GET /faculties/1
  # GET /faculties/1.json
  def show
    @faculty = Faculty.find(params[:id])
    @courses = Course.find_all_by_faculty_id(@faculty.id)
    @courses=@courses.sort_by(&:num)
    respond_to do |format|
      format.html # show.html.erb
      format.xml
      format.json { render json: @faculty }
    end
  end

  # GET /faculties/new
  # GET /faculties/new.json
  def new
    @faculty = Faculty.new
    @universities = University.order(:name)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty }
    end
  end

  # GET /faculties/1/edit
  def edit
    @faculty = Faculty.find(params[:id])
    @universities = University.order(:name)
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(params[:faculty])

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to root_url, notice: 'Faculty was successfully created.' }
        format.json { render json: @faculty, status: :created, location: @faculty }
      else
        format.html { render action: "new" }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faculties/1
  # PUT /faculties/1.json
  def update
    @faculty = Faculty.find(params[:id])

    respond_to do |format|
      if @faculty.update_attributes(params[:faculty])
        format.html { redirect_to root_url, notice: 'Faculty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
