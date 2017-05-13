class LikesController < ApplicationController

  def create
    like = Like.new
    post ||= Post.find params[:post_id]
    like.post = post
    like.user = current_user
    if like.save
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  def destroy
    post ||= Post.find params[:post_id]

    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to post_path(post)
  end
end
