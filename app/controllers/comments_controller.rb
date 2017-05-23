class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @comment.user = current_user
    @post = Post.find params[:post_id]
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @user = User.find @comment.user_id

    if current_user.id == @comment.user_id || current_user.is_admin == true
      @comment.destroy
      redirect_to post_path(@comment.post_id)
    else
      redirect_to post_path(@comment.post_id)
    end
  end

end
