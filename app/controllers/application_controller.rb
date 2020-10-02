class ApplicationController < ActionController::Base
  # Any method that you add to your application controller will be available
  # to all of your controllers (only controllers)

  # This makes the current_user/logged_in? method available to our views(helper) as well
  helper_method :current_user, :logged_in?

  # Returns the details of the user that is logged in
  def current_user
    # Return current user if you have cu already if not then do a query to find the user
    # This is helpful so that everytime the current_user method is called, the application
    # is not making a call to the user's table for the user info. Instead it just uses the
    # instance variable.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Check if there is user that is already logged in
  def logged_in?
    # Check if the current user exists by turning into a boolean (either true/false)
    !!current_user
  end
end
