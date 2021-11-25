class CategoriesController < ApplicationController
  def index
  end

  def show
    @c = Category.all.map{ |u| [ u.name, u.id ] }
    @category = Category.find(params[:id])
  end
end
