class PostsController < ApplicationController

  before_action :set_post, only:[:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    @post.tags.build
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = "Your post has been successfully create"
      redirect_to posts_path
    else
      flash[:notice] = "Something went wrong, please try again"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:notice] = @post.title + " has been successfully updated"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Something went wrong, please try again"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :root
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :author,  tags_attributes: [:name], tag_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end