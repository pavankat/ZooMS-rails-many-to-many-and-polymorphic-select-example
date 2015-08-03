class AddToyableToCatToys < ActiveRecord::Migration
  def change
    add_reference :cat_toys, :toyable, polymorphic: true, index: true
  end
end
