class CategoriesController < ApplicationController
  def index
    if params[:search]
      keyword = "%#{params[:search].downcase}%"
      @categorys =
        Category.where('lower(name) LIKE ?', keyword).order(:name)
    else
      @categorys = Category.order(:name)
    end
  end

  def show
    @category = Category.find_by id: params[:id]
  end
end
