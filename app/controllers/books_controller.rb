class BooksController < ApplicationController
  def index
    @c = Category.all.map{ |u| [ u.name, u.id ] }
    @books = Book.paginate(:page => params[:page], :per_page=>5).order(:title)
    @categories = Category.all
  end

  def show
    @c = Category.all.map{ |u| [ u.name, u.id ] }
    @book = Book.find(params[:id])
  end
  def search
    @c = Category.all.map{ |u| [ u.name, u.id ] }
    if !params[:category_id].empty?
      @books = Book.joins(:classifications).where(classifications: { category_id: params[:category_id] }).where("title OR description LIKE ?","%#{params[:search_term]}%")
    else
      @books = Book.where("title OR description LIKE ?","%#{params[:search_term]}%")
    end
  end
end
