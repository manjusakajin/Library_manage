class CategorysController < ApplicationController
  def index
    @categorys = Category.order(:name)
  end

  def show
    @category = Category.find_by id: params[:id]
  end
end
