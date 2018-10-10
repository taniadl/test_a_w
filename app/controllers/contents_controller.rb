class ContentsController < ApplicationController
  before_action :set_content, only: [:edit, :update, :destroy, :show]
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      render :show
    else
    end
  end

  def show
  end

  def edit
  end

  def update
    @content = Content.update(content_params)
    if @content.save
      render :show
    else
    end
  end

  def destroy
    @content.destroy
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :type)
  end
end
