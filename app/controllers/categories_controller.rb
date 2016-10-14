class CategoriesController < ApplicationController
  def index
    @categories = Category.json_hash_tree(Category.hash_tree)
    render json: @categories
  end
end
