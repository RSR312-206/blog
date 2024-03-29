class TagsController < ApplicationController
  before_action :set_tag, only:[:show, :edit, :update, :destroy]
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      flash[:notice] = "Your tag has been successfully create"
      redirect_to tags_path
    else
      flash[:notice] = "Something went wrong, please try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @tag.update(tag_params)
    if @tag.save
      flash[:notice] = "tag has been successfully updated"
      redirect_to tags_path
    else
      flash[:notice] = "Something went wrong, please try again"
      render :index
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

end
