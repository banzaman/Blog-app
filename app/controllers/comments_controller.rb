class CommentsController < ApplicationController
  before_action :set_post

  def create
    @current_user = current_user
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to post_comments_path(@current_user.id, @post.id), notice: 'Comment posted.'
    else
      render 'posts/show'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
