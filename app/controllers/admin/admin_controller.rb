module Admin
  class AdminController < ApplicationController
    before_action :check_admin_user
    def check_admin_user
      redirect_to '/401' unless current_user&.admin?
    end
  end
end