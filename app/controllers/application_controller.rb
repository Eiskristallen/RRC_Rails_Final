class ApplicationController < ActionController::Base
  before_action :load_categories
  private
  def load_categories
   @c = Category.all.map{ |u| [ u.name, u.id ] }
  end
end
