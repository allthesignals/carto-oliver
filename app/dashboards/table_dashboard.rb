require "administrate/base_dashboard"

class TableDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    table_name: Field::String,
    description: Field::Text,
    sql: Field::String,
    css: Field::Text,
    category: Field::BelongsTo,
    position: Field::Number,
    visible: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :visible,
    :table_name,
    :description,
    :sql,
    :position,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :table_name,
    :description,
    :category,
    :sql,
    :visible,
    :css,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :table_name,
    :description,
    :category,
    :sql,
    :css,
    :visible,
  ].freeze

  # Overwrite this method to customize how tables are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(table)
    "#{table.table_name}"
  end
end
