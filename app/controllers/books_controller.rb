class BooksController < ApplicationController
  def index
    @books =
      Book.order(:name).page(params[:page]).per Settings.paginate.per_page
  end

  def show
    @book = Book.find_by id: params[:id]
  end
end
