class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
   p 1111111111111111111111111111111111

p params
p 44444444444
  if user = User.authenticate(params[:name], params[:password])
     
  session[:user_id] = user.id
 # find = User.find_by_id(session[:user_id])
  
  #p find
  p 555555555555555555555555555555555555555
  p session[:user_id]      = user.id
     session[:user_name] = user.name
     p 111111111111111111111111111111
     p  session[:user_role]    = user.role
     p  1111111111111111
    if(!session[:user_role] == 'admin')
            redirect_to store_index_url
    # else
      #  redirect_to store_index_url
   end
  
  else
  redirect_to login_url, :alert => "Invalid user/password combination"
end

  end

  def destroy
  session[:user_id] = nil
   session[:user_name]  =nil
   session[:user_role]    =nil
  redirect_to login_url, :notice => "Logged out"

  end
  def createfacebook
  auth = request.env["omniauth.auth"]
  user = User.where(:provider => auth['provider'], :uid => auth['uid']).first || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end
end

