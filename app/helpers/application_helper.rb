module ApplicationHelper
#Any method that you would like to use in the views you can add to the helper


  #This is the gravatar helper that was defined on the gravatar/how to use/ruby site
  #Gave the helper method a default size option for the image if nothing provided.
  def gravatar_for(user, options = {size: 80})
    #get the email from url-parameters or what email you have in database
    email_address = user.email.downcase
    #create the hash for the email address
    hash = Digest::MD5.hexdigest(email_address)
    #If the size is provided for the image
    size = options[:size]
    #compile the url which can be used in <img src ="url here" and insert the size to the end of the url
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    #Return the url in the image tag or just put the username
    image_tag(gravatar_url, class: "rounded shadow mx-auto d-block", alt: user.username)
  end

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
