class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to books_path
    end
  end

  def help; end

  def about; end
end
