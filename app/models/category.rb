class Category < ApplicationRecord
  has_closure_tree order: 'sort_order'
  has_many :tables, -> { order(position: :asc) }

  def self.json_hash_tree(tree)
    tree.map { |parent, children| parent.to_hash(children) }
  end

  # Help me.
  def to_hash(children)
    subcategories = 
      children.map do |key, val| 
        if (key.respond_to? :each) 
          self.class.json_hash_tree(key) 
        else 
          if (val.empty?)
            { name: key.name, depth: key.depth, tables: key.tables }
          else
            { name: key.name, depth: key.depth, tables: key.tables, subcategories: self.class.json_hash_tree(val) }
          end
        end
      end

    if (subcategories.empty?)
      { name: self.name, depth: self.depth, tables: self.tables }
    else
      { name: self.name, depth: self.depth, tables: self.tables, subcategories: subcategories }
    end
  end

  # this is causing many issues with Administrate... 
  # it may be an issue with closure, however. 
  # this generates SQL errors. Either the sql is too complicated or 
  # a method is causing problems

  # maybe this is a rails 5 issue?
  # how about setting a validation that parent_id can never be nil unless it's the only one
  # default_scope -> { roots_and_descendants_preordered }
end
