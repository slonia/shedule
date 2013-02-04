class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  skip_before_filter :authorize, only: [:select, :show]
  def index
    @groups = Group.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end
  def select
    @groups = Group.find_all_by_course_id(params[:course])
    @groups = @groups.sort_by(&:name)
    @subjects=[]
    @names=[]
    @teachers=[]
    @places=[]
    @groups.each do |group|
      days = Day.find_all_by_group_id(group.id)
      days.each do |day|
        @subjects+=Subject.find_all_by_day_id(day.id)
      end
    end
    @subjects.each do |subject|
      @names.push subject.name
      @teachers.push subject.teacher
      @places.push subject.place
    end
    @names=@names.uniq.sort
    @teachers=@teachers.uniq.sort
    @places=@places.uniq.sort
    respond_to do |format|
      format.js
      format.json { render json: @faculties }
    end
  end
  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @days = Day.find_all_by_group_id(@group.id);
    @days = @days.sort_by(&:num)
    respond_to do |format|
      format.html # show.html.erb
      format.xml
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    @universities = University.order(:name)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
    @universities = University.order(:name)
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
