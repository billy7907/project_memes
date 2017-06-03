class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email params[:email]
    respond_to do |format|
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        format.js { render :success}
      else
        format.js {render :failure}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
