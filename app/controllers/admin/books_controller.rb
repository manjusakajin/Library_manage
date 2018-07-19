class Admin::BooksController < Admin::ApplicationController
  before_action :find_book, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
    @categorys = Category.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Create Book Success"
      redirect_to root_url
    else
      flash[:danger] = "Create Book Fail"
      render :new
    end
  end

  def edit
    @categorys = Category.all
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = "Book Update Success"
      redirect_to @book
    else
      flash[:danger] = "Update Book Fail"
      render :edit
    end
  end

  def destroy
   if @book.destroy
     flash[:success] = "Delete Book Success"
   else
     flash[:danger] = "Delete Book Fail"
   end
   redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit :name, :author, :publisher, category_ids: []
  end

  def find_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = "Can not find book"
      redirect_to root_url
    end
  end
end
