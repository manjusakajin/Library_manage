class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: [:update, :destroy]

  def index
    @users = User.select_user.page(params[:page]).per Settings.paginate.per_page
  end

  def update
    if @user.update_attributes(:admin => true)
      flash[:success] = "Set admin success"
    else
      flash[:danger] = "Set Admin Fail"
    end
    redirect_to admin_users_url
  end

  def destroy
    if @user.destroy
      flash[:success] = t "success.delete"
    else
      flash[:danger] = t "error.delete"
    end
    redirect_to admin_users_url
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "danger.not_found"
      redirect_to root_url
    end
  end
end
