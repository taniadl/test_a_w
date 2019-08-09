class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show]


  def index
    @projects = policy_scope(Project)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def show
    @content = Content.new
    @content.project_id = @project.id
  end

  def create
    @project = Project.new(project_params)
    @content = @project.contents.build

    @project.user = current_user
    authorize @project
    if @project.save
      render :show
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end
end
