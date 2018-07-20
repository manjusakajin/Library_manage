class Admin::RequestsController < Admin::ApplicationController
  before_action :find_request, except: :index
  def index
    @requests =
      Request.order(:created_at).where(accept: nil).page(
        params[:page]).per Settings.paginate.per_page
  end

  def update
    if @request.update_attributes(accept: true)
      flash[:success] = "Accepted"
    else
      flash[:danger] = "Cannot Accept"
    end
    redirect_to admin_requests_url
  end

  def destroy
    if @request.destroy
      flash[:success] = " Rejected"
    else
      flash[:danger] = "Cannot Reject"
    end
    redirect_to admin_requests_url
  end

  private

  def find_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:danger] = "Can not find Request"
    redirect_to root_url
  end
end
