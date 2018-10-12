class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show

  end

  def create

    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      render :show
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end
end
