class BooksController < ApplicationController
  before_action :load_cart
  def index
   @books = Book.all
   @books = Kaminari.paginate_array(@books).page(params[:page]).per(5)
  @categories = Category.all
  @orders = Order.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def new_release
    @books = Book.all
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end
  def recently_update
    @books = Book.all
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end
  def load_cart
    keys = session[:cart].keys
    @cart_items = Book.find(keys)
  end
  def search
    if !params[:category_id].empty?
      @books = Book.joins(:classifications).where(classifications: { category_id: params[:category_id] }).where("title OR description LIKE ?","%#{params[:search_term]}%")
    else
      @books = Book.where("title OR description LIKE ?","%#{params[:search_term]}%")
    end
  end
  def add_to_cart
    if session[:cart]!={}
      if session[:cart].key?(user_params[:id])
        num = session[:cart][user_params[:id]]['quantity']
        session[:cart][user_params[:id]]['quantity']= (user_params[:quantity].to_i + num)
        redirect_to root_path
      else
        session[:cart][user_params[:id]] = {'quantity'=>user_params[:quantity].to_i}
        redirect_to root_path
      end
    else
      session[:cart][user_params[:id]] = {'quantity'=>user_params[:quantity].to_i}
      redirect_to root_path
    end
  end
  def modify_add_cart
    session[:cart][user_params[:id]]['quantity'] = user_params[:quantity].to_i
    redirect_to root_path
  end
  def remove_from_cart()
    session[:cart] = session[:cart].without(user_params[:id].to_s)
    redirect_to root_path
  end
  def user_params
    params.permit(:id,:quantity)
  end
  private
end
