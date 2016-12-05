class ProjectsController < ApplicationController
  before_action :authenticate_user!

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all # gets all the Projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @owner = User.find(@project.owner_id)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.owned_projects.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /projects/1/follow
  def follow
    @project = Project.find(params[:id])
    current_user.follow(@project) unless current_user.following?(@project)
    redirect_to :back
  end

  # POST /projects/1/unfollow
  def unfollow
    @project = Project.find(params[:id])
    current_user.stop_following(@project) if current_user.following?(@project)
    redirect_to :back
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    @projects = current_user.all_following + current_user.owned_projects.order(updated_at: :desc)
    @current_projects = current_user.owned_projects.order(created_at: :desc).first(2)
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :points, :image, tag_ids: [])
    end
end
