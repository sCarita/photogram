class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC").page params[:page]

    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "our new post couldn't be created! Please check the form."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated."
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Your post was deleted successfully!"
    redirect_to posts_path
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private
  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  def post_params
    params.require(:post).permit(:image,
                                 :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "Sorry! You are not the owner of this post."
      redirect_to root_path
    end
  end
end
