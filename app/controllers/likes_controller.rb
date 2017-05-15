class LikesController < ApplicationController

  def create
    @post ||= Post.find params[:post_id]
    like = Like.new(user: current_user, post: @post)

    if like.save
      redirect_to posts_path(@post)
    else
      redirect_to posts_path(@post)
    end
  end

  def destroy
    @like ||= Like.find params[:id]
    @like.destroy
    redirect_to post_path(@like.post)
  end

end
