class SessionsController < ApplicationController

  def new

  end

  def create
    # Find the user by their email from their session params
    user = User.find_by(email: params[:session][:email].downcase)
    # If the user is found
    if user && user.authenticate(params[:session][:password])
      # Creates a user session according the user id and keeps them in a logged in state
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
      # If the user is not found
    else
      # Use flash now because you are not being redirected to a different page but staying on the same form
      flash.now[:alert] = "There was somthing wrong with your log in details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Later"
    redirect_to root_path
  end

end