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

end
