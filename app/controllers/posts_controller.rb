class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
    # @vote = @posts.vote_for(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    post_params = params.require(:post).permit(:title, :image)
  end

end
