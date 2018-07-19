class Admin::CategorysController < Admin::ApplicationController
  before_action :find_category, except: :new

  def show
    @books =
      @category.books.order(:name).page(
        params[:page]).per Settings.paginate.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create Category Success"
      redirect_to root_url
    else
      flash[:danger] = "Create Category Fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Category Update Success"
      redirect_to @category
    else
      flash[:danger] = "Update Category Fail"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Delete #{@category.name} Success"
    else
      flash[:danger] = "Delete Category Fail"
    end
    redirect_to categorys_url
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def find_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = "Cannot find category"
      redirect_to root_url
    end
  end
end
