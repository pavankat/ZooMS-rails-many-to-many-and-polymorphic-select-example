class Panther < ActiveRecord::Base
	has_many :cat_toys, :as => :toyable, dependent: :destroy

	validates :name, :uniqueness => true, :presence => true
	validates :claw_length, :presence => true

	# create_table "panthers", force: true do |t|
	#   t.string   "name"
	#   t.integer  "claw_length"
	#   t.datetime "created_at"
	#   t.datetime "updated_at"
	# end
end
