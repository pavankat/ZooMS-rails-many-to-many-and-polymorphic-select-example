class CreatePanthers < ActiveRecord::Migration
  def change
    create_table :panthers do |t|
      t.string :name
      t.integer :claw_length

      t.timestamps
    end
  end
end
