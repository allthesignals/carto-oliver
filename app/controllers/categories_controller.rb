class CategoriesController < ApplicationController
  def index
    @categories = Category.hash_tree
    render json: @categories
  end
end
