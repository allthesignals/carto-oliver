class MapController < ApplicationController
  def index
    @tables = Table.where(visible: true).order(position: :desc)
  end
end
