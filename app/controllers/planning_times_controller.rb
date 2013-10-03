class PlanningTimesController < ApplicationController
  # GET /planning_times
  # GET /planning_times.json
  def index
    @planning_times = PlanningTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planning_times }
    end
  end

  # GET /planning_times/1
  # GET /planning_times/1.json
  def show
    @planning_time = PlanningTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planning_time }
    end
  end

  # GET /planning_times/new
  # GET /planning_times/new.json
  def new
    @planning_time = PlanningTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planning_time }
    end
  end

  # GET /planning_times/1/edit
  def edit
    @planning_time = PlanningTime.find(params[:id])
  end

  # POST /planning_times
  # POST /planning_times.json
  def create
    @planning_time = PlanningTime.new(params[:planning_time])

    respond_to do |format|
      if @planning_time.save
        format.html { redirect_to @planning_time, notice: 'Planning time was successfully created.' }
        format.json { render json: @planning_time, status: :created, location: @planning_time }
      else
        format.html { render action: "new" }
        format.json { render json: @planning_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planning_times/1
  # PUT /planning_times/1.json
  def update
    @planning_time = PlanningTime.find(params[:id])

    respond_to do |format|
      if @planning_time.update_attributes(params[:planning_time])
        format.html { redirect_to @planning_time, notice: 'Planning time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @planning_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planning_times/1
  # DELETE /planning_times/1.json
  def destroy
    @planning_time = PlanningTime.find(params[:id])
    @planning_time.destroy

    respond_to do |format|
      format.html { redirect_to planning_times_url }
      format.json { head :no_content }
    end
  end
end
