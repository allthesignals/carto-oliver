class Map < ApplicationRecord
  # acts_as_list scope: :category

  def self.url
    "https://mapc-admin.carto.com/api/v1/viz/?api_key=#{ENV['CARTO_API_KEY']}&per_page=100"
  end

  def self.sync
    self.create(new_maps.map { |map_uuid| { map_uuid: map_uuid } })
    self.where(map_uuid: old_maps).destroy_all
  end

  def self.carto_tables
    uri           = URI(url)
    response      = Net::HTTP.get(uri)
    json_response = JSON.parse(response)

    json_response['visualizations'].map { |row| row['id'] }
  end

  def self.new_maps
    carto_tables - self.pluck(:map_uuid)
  end

  def self.old_maps
    self.pluck(:map_uuid) - carto_tables
  end
end
