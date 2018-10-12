class ContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_content, only: [:edit, :update, :destroy, :show]


  def show
  end

  def new
    @content = Content.new
  end

  def create
    @project = Project.find(params[:project_id])
    @content = @project.contents.new(content_params)
    @content.user = current_user
    if @content.save
      redirect_to project_path(@project)
    end
  end

  def edit
     @project= Project.find(params[:project_id])
    @content = @project.contents.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @content = @project.contents.find(params[:id])
    if @content.update_attributes(content_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project= Project.find(params[:project_id])
    @content = @project.contents.find(params[:id])
    @content.destroy

    redirect_to project_path(@project)
  end

private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :type)
  end
end
