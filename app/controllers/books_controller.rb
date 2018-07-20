class BooksController < ApplicationController
  def index
    if params[:search]
      keyword = "%#{params[:search].downcase}%"
      @books = []
      Category.where('lower(name) LIKE ?', keyword).each do |c|
        @books << c.books
      end
      @books << Book.where('lower(name) LIKE ?', keyword)
      @books << Book.where('lower(author) LIKE ?', keyword)
      @books << Book.where('lower(publisher) LIKE ?', keyword)
      @books = Kaminari.paginate_array(@books).page(params[:page]).per(
        Settings.paginate.per_page)
    else
      @books =
        Book.order(:name).page(params[:page]).per Settings.paginate.per_page
    end
  end

  def show
    @book = Book.find_by id: params[:id]
    @categorys = @book.categorys
    @request = Request.new
  end
end
