class UniversitiesController < ApplicationController
  # GET /universities
  # GET /universities.json
  skip_before_filter :authorize, only: [:select, :index, :show]
  def index
    @universities = University.order(:name)
    respond_to do |format|
      format.xml
      format.html # index.html.erb
      format.json { render json: @universities }
    end
  end
  def select
    @universities = University.order(:name)
    respond_to do |format|
      format.html # select.html.erb
      format.json { render json: @universities }
    end
  end
  # GET /universities/1
  # GET /universities/1.json
  def show
    @university = University.find(params[:id])
    @faculties = Faculty.find_all_by_university_id(@university.id)
    @faculties=@faculties.sort_by(&:name)
    respond_to do |format|
      format.html # show.html.erb
      format.xml
      format.json { render json: @university }
    end
  end

  # GET /universities/new
  # GET /universities/new.json
  def new
    @university = University.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @university }
    end
  end

  # GET /universities/1/edit
  def edit
    @university = University.find(params[:id])
  end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(params[:university])

    respond_to do |format|
      if @university.save
        format.html { redirect_to universities_url, notice: 'University was successfully created.' }
        format.json { render json: @university, status: :created, location: @university }
      else
        format.html { render action: "new" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /universities/1
  # PUT /universities/1.json
  def update
    @university = University.find(params[:id])
    
    respond_to do |format|
      if @university.update_attributes(params[:university])
        format.html { redirect_to universities_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university = University.find(params[:id])
    @university.destroy

    respond_to do |format|
      format.html { redirect_to universities_url }
      format.json { head :no_content }
    end
  end

end
