class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Category.all
    @orders = Order.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def search
    if !params[:category_id].empty?
      @books = Book.joins(:classifications).where(classifications: { category_id: params[:category_id] }).where("title OR description LIKE ?","%#{params[:search_term]}%")
    else
      @books = Book.where("title OR description LIKE ?","%#{params[:search_term]}%")
    end
  end
end
