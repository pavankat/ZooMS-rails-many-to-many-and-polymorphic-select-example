class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :lead_actor
      t.integer :rating

      t.timestamps
    end
  end
end
