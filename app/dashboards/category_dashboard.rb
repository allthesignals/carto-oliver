require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    parent: Field::BelongsTo.with_options(class_name: "Category"),
    children: Field::HasMany.with_options(class_name: "Category"),
    tables: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    parent_id: Field::Number,
    lft: Field::Number,
    rgt: Field::Number,
    depth: Field::Number,
    children_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :parent,
    :children,
    :tables,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :parent,
    :children,
    :tables,
    :id,
    :name,
    :parent_id,
    :lft,
    :rgt,
    :depth,
    :children_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :parent,
    :children,
    :tables,
    :name,
    :parent_id,
    :lft,
    :rgt,
    :depth,
    :children_count,
  ].freeze

  # Overwrite this method to customize how categories are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(category)
    "#{category.name}"
  end
end
