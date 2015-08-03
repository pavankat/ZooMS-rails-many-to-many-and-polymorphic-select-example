class CreateJoinTableLionTamerLion < ActiveRecord::Migration
  def change
    create_join_table :lion_tamers, :lions do |t|
      t.index [:lion_tamer_id, :lion_id]
      t.index [:lion_id, :lion_tamer_id]
    end
  end
end
