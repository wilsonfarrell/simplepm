class ProjectRolesController < ApplicationController
  # GET /project_roles
  # GET /project_roles.json
  def index
    @project_roles = ProjectRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_roles }
    end
  end

  # GET /project_roles/1
  # GET /project_roles/1.json
  def show
    @project_role = ProjectRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_role }
    end
  end

  # GET /project_roles/new
  # GET /project_roles/new.json
  def new
    @project_role = ProjectRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_role }
    end
  end

  # GET /project_roles/1/edit
  def edit
    @project_role = ProjectRole.find(params[:id])
  end

  # POST /project_roles
  # POST /project_roles.json
  def create
    @project_role = ProjectRole.new(params[:project_role])

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to @project_role, notice: 'Project role was successfully created.' }
        format.json { render json: @project_role, status: :created, location: @project_role }
      else
        format.html { render action: "new" }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /project_roles
  # POST /project_roles.json
  def add_role_to_project
    @project_role = ProjectRole.new(params[:project_role])

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to assign_roles_project_path(@project_role.project) , notice: 'New project role was successfully added.' }
      else
        format.html { render assign_roles_project_path(@project_role.project) }
      end
    end
  end

  # DELETE /project_roles/1
  # DELETE /project_roles/1.json
  def remove_role_from_project
    @project_role = ProjectRole.find(params[:id])
    @project_role.destroy

    respond_to do |format|
      format.html { redirect_to assign_roles_project_path(@project_role.project) , notice: 'New project role was successfully added.' }
    end
  end


  # PUT /project_roles/1
  # PUT /project_roles/1.json
  def update
    @project_role = ProjectRole.find(params[:id])

    respond_to do |format|
      if @project_role.update_attributes(params[:project_role])
        format.html { redirect_to @project_role, notice: 'Project role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_roles/1
  # DELETE /project_roles/1.json
  def destroy
    @project_role = ProjectRole.find(params[:id])
    @project_role.destroy

    respond_to do |format|
      format.html { redirect_to project_roles_url }
      format.json { head :no_content }
    end
  end

  protected
  
  def update_action

  end

  def create_action

  end
end
