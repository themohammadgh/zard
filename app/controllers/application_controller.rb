class ApplicationController < ActionController::Base
  #cross site request forgery
  protect_from_forgery with: :exception

  def confirm_logged_in
    if !session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to access_login_path
      #redirect_to prevents the requested action from running
    end
  end
end
