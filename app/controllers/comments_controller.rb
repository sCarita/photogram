class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_coment, only: [:destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Your comment has been published."
      redirect_to :back
    else
      flash[:alert] = "Somthing went wrong with your comment, try again later."
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    flash[:sucess] = "Comment has been eliminated."
    redirect_to root_path
  end

  #def destroy
  #  @comment = @post.comments.find(params[:id])
  #
  #  @comment.destroy
  #  flash[:success] = "Comment deleted :("
  #  redirect_to root_path
  #end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
