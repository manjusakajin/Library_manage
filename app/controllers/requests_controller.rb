class RequestsController < ApplicationController
  before_action :logged_in_user

  def create
    @request = current_user.request(params[:book_id], params[:request][:start], params[:request][:finish])
    if @request
      flash[:success] = "Request success. Please wait.."
    else
      flash[:danger] = "Request fail"
    end
    redirect_to root_url
  end

  def destroy
  end
end
