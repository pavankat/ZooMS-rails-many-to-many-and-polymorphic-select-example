class CreateLionTamers < ActiveRecord::Migration
  def change
    create_table :lion_tamers do |t|
      t.string :name
      t.integer :experience
      t.boolean :living

      t.timestamps
    end
  end
end
