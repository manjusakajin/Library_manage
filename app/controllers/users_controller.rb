class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:notice] = t "check_active"
      redirect_to root_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success.update"
      redirect_to @user
      return
    end
    flash.now[:danger] = t "error.update"
    render :edit
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    flash[:danger] = t "error.find_user" unless @user
  end

  def correct_user
    find_user

    return if @user.is_user? current_user
    flash[:danger] = t "error.wrong_user"
    redirect_to root_url
  end

end
