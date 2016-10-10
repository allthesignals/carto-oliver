require 'uri'
require 'json'

class Table < ApplicationRecord
  def self.sync
    # get list of carto tables, check if each has spatial data
    url = 'https://mapc.carto.com/u/mapc-admin/api/v1/viz?types=table&per_page=1000'

    uri = URI(url)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)

    json_response["visualizations"].each do |visualization|
      puts visualization["table"]["name"]
    end
  end
end
