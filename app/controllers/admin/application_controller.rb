class Admin::ApplicationController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin

  def check_admin
    unless current_user.admin?
      flash[:danger] = "Just admin can do this"
      redirect_to root_url
    end
  end
end
