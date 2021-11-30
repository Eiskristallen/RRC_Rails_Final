class ApplicationController < ActionController::Base
  before_action :load_categories,:current_customer,:initial_session

  private
  def current_customer
    if current_account
      @customer = current_account
    end
  end
  def load_categories
   @c = Category.all.map{ |u| [ u.name, u.id ] }
  end
  def initial_session
    session[:cart]||={}
  end
end
