class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #Gives articles instance variable and pulls all articles associated with user into the variable
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def create
    #Similar to articles create method in articles controller
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog, #{@user.username} you're all signed up!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    #This will find the user via their id on the users table
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account info was updated successfully!"
      redirect_to articles_path
    else
      #Renders the edit page with the list of errors
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end