class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
    #Gives articles instance variable and pulls all articles associated with user into the variable
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def create
    #Similar to articles create method in articles controller
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog, #{@user.username} you're all signed up!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    #This will find the user via their id on the users table
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account info was updated successfully!"
      redirect_to @user
    else
      #Renders the edit page with the list of errors
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end