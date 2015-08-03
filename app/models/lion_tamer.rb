class LionTamer < ActiveRecord::Base
	has_and_belongs_to_many :lions

	validates :name, :uniqueness => true, :presence => true

	validates :experience, :presence => true
	validates :living, :presence => true

	# create_table "lion_tamers", force: true do |t|
	#   t.string   "name"
	#   t.integer  "experience"
	#   t.boolean  "living"
	#   t.datetime "created_at"
	#   t.datetime "updated_at"
	# end

	# create_table "lion_tamers_lions", id: false, force: true do |t|
	#   t.integer "lion_tamer_id", null: false
	#   t.integer "lion_id",       null: false
	# end

end
