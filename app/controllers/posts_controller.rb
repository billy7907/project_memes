class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
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

  def fresh
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    post_params = params.require(:post).permit(:title, :image)
  end

end
