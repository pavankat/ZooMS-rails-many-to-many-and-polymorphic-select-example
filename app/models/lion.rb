class Lion < ActiveRecord::Base
	has_and_belongs_to_many :lion_tamers
	has_many :cat_toys, :as => :toyable, dependent: :destroy

	validates :name, :uniqueness => true, :presence => true

	validates :birthdate, :presence => true
	validates :about, :presence => true
	validates :weight, :presence => true
	validates :health, :presence => true
	validates :health_notes, :presence => true

	# create_table "lions", force: true do |t|
	#   t.date     "birthdate"
	#   t.string   "name"
	#   t.text     "about"
	#   t.integer  "weight"
	#   t.integer  "health"
	#   t.text     "health_notes"
	#   t.datetime "created_at"
	#   t.datetime "updated_at"
	# end
end
