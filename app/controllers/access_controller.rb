class AccessController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def menu
    #display text and fields
    @username = session[:username]
  end

  def login
    #login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(username: params[:username]).first
      #first is because we don't want an array of one users,
      #we want the user itself
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in!"
      redirect_to admin_path
    else
      flash.now[:notice] = "Invalid username/password combination."
      render("login")
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "logged out."
    redirect_to access_login_path
  end

  private

  # def confirm_logged_in
  #   if !session[:user_id]
  #     flash[:notice] = "Please log in."
  #     redirect_to access_login_path
  #     #redirect_to prevents the requested action from running
  #   end
  # end
end
