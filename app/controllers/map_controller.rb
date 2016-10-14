class MapController < ApplicationController
  def index
    @tables = Table.where(visible: true).order(position: :desc)
    @categories = Category.json_hash_tree(Category.hash_tree)
  end
end
