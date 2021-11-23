class ApplicationController < ActionController::Base
  
  private
  def find_categories
    @c = Category.all
  end
end
