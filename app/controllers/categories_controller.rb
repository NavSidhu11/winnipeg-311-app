class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @requests = @category.requests
  end
end