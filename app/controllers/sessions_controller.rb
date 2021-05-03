class SessionsController < ApplicationController
  before_action :check_logged_in

  def new; end

  def admin_login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      login_user(user)
      redirect_to '/admin/dashboard'
    else
      flash[:alert] = 'Invalid Email or Password'
      redirect_to '/admin/login'
    end
  end

  private

  def check_logged_in
    redirect_to '/admin/dashboard' if logged_in?
  end
end
