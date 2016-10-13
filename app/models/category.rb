class Category < ApplicationRecord
  has_closure_tree order: 'sort_order'
  has_many :tables

  # this is causing many issues with Administrate... 
  # it may be an issue with closure, however. 
  # this generates SQL errors. Either the sql is too complicated or 
  # a method is causing problems

  # maybe this is a rails 5 issue?
  # how about setting a validation that parent_id can never be nil unless it's the only one
  # default_scope -> { roots_and_descendants_preordered }
end
