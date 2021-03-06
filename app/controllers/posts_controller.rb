class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end


  def edit
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end


  def create
    @post = Post.new(post_params)

    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "Post was successfully created."
      else
        render :new
      end
    end
  end

  def update

    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end 

  def post_params
    params.require(:post).permit(:content)
  end

end
