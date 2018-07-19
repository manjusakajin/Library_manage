class Admin::RequestsController < Admin::ApplicationController
  def index
    @requests =
      Request.order(:created_at).page(params[:page]).per Settings.paginate.per_page
  end

  def update
    find_request
    if @request.update_attributes(accept: params[:accept])
      flash[:success] = "Accepted"
    else
      flash[:danger] = "Cannot Accept"
    end
    redirect_to admin_users_url
  end

  private

  def find_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:danger] = "Can not find Request"
    redirect_to root_url
  end
end
