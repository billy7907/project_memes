class VotesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_post, only: :create
  before_action :vote_create, only: :create
  before_action :find_vote, :authorize_vote_change, only: [:update, :destroy]

  def create
    vote = Vote.new user: current_user, post: @post, is_up: params[:is_up]
    if vote.save
      p 'saved'
      redirect_to :back
    else
      p 'not saved'
      redirect_to :back
    end
  end

  def update
    if @vote.update is_up: params[:is_up]
      p 'update'
      redirect_to :back
    else
      p 'update'
      redirect_to :back
    end
  end

  def destroy
    if @vote.destroy
      p 'destroy'
      redirect_to :back
    else
      p 'destroy'
      redirect_to :back
    end
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end

  def find_vote
    @vote = Vote.find params[:id]
  end

  def vote_create
    redirect_to @post if cannot? :vote, @post
  end

  def authorize_vote_change
    if cannot? :manage, @vote
      redirect_to @vote.post
    end
  end

end
