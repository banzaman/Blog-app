class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.new(like_params)

    if @like.save
      redirect_to post_comments_path(current_user, @post), notice: 'Post liked.'
    else
      redirect_to post_comments_path(current_user, @post), alert: 'Failed to like post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.permit(:author_id, :post_id)
  end
end
