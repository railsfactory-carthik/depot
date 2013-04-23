class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
  if user = User.authenticate(params[:name], params[:password])
  session[:user_id] = user.id
 # find = User.find_by_id(session[:user_id])
  
  #p find
  p session[:user_id]      = user.id
     session[:user_name] = user.name
     session[:user_role]    = user.role
    if(session[:user_role] == 'admin')
            redirect_to products_url
     else
        redirect_to store_index_url
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
end

