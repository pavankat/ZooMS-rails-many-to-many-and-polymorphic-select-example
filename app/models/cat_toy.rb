class CatToy < ActiveRecord::Base
	belongs_to :toyable, :polymorphic => true

	validates :name, :uniqueness => true, :presence => true

	# create_table "cat_toys", force: true do |t|
	#   t.string   "name"
	#   t.datetime "created_at"
	#   t.datetime "updated_at"
	#   t.integer  "toyable_id"
	#   t.string   "toyable_type"
	# end
end
