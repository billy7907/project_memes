class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
    render :new, layout: false
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @vote = @post.vote_for(current_user)
  end

  def create
    @post = Post.new post_params
    @post.user = current_user

    respond_to do |format|
      if @post.save
        p 'success'
        format.html { redirect_to root_path }
      else
        p 'failed'
        format.js { render :failure }
      end
    end

  end

  def hot
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    post_params = params.require(:post).permit(:title, :image)
  end

end
