class ContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
  end

  def new
    @content = Content.new
    authorize @content
  end

  def create
    @content = Content.new(content_params)
    @content.project_id = params[:project_id]

    authorize @content
    if @content.save
      redirect_to project_path(@content.project)
    end
  end

  def edit
    @content = Content.find(params[:id])
    @content.project_id = params[:project_id]
    authorize @content
    respond_to do |format|
      format.js
    end
  end

  def update
     @content = Content.find(params[:id])
    @content.project_id = params[:project_id]
    authorize @content
    respond_to do |format|
      if @content.update_attributes(content_params)
          format.html

          format.js { }
          format.json { head :no_content }

      else
        puts @content.errors.full_messages
        redirect_to :new
      end
    end
  end

  def destroy

    @content = Content.find(params[:id])
    @content.destroy

    authorize @content
    redirect_to project_path(@content.project)
  end

private

  def content_params
    params.require(:content).permit(:title, :type, :project_id)
  end
end
