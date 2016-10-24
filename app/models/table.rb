class Table < ApplicationRecord
  # this is causing some problems with mass creating records
  # belongs_to :category 
  acts_as_list scope: :category

  after_initialize :set_default_values
  
  def self.sync
    #create new tables and delete old ones that don't exist
    self.create(new_tables.map { |table_name| { table_name: table_name } })
    # new_tables.map{ |table_name| self.new(table_name: table_name).save }
    self.where(table_name: old_tables).destroy_all
    # self.destroy(old_tables.map { |table_name| { table_name:  } })
  end

  def self.url
    "http://#{ENV['CARTO_ACCOUNT']}.carto.com/api/v2/sql?q=SELECT%20*%20FROM%20CDB_UserTables('public')&api_key=#{ENV['CARTO_API_KEY']}"
  end

  def self.carto_tables
    uri           = URI(url)
    response      = Net::HTTP.get(uri)
    json_response = JSON.parse(response)

    json_response['rows'].map { |row| row['cdb_usertables'] }
  end

  def self.new_tables
    carto_tables - self.pluck(:table_name)
  end

  def self.old_tables
    self.pluck(:table_name) - carto_tables
  end

  def set_default_values
    # Only set if sql IS NOT set
    self.sql ||= "SELECT * FROM #{table_name}"
  end
end
