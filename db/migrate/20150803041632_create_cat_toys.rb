class CreateCatToys < ActiveRecord::Migration
  def change
    create_table :cat_toys do |t|
      t.string :name

      t.timestamps
    end
  end
end
