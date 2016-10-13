class Category < ApplicationRecord
  has_closure_tree order: 'sort_order'

  before_save :compute_depth

  has_many :tables

  # this is causing many issues with Administrate... 
  # it may be an issue with closure, however. 
  # this generates SQL errors. Either the sql is too complicated or 
  # a method is causing problems
  # default_scope -> { roots_and_descendants_preordered }

  # pre-calculate the depth
  # def compute_depth
  #   computed_depth = depth
  # end
end
