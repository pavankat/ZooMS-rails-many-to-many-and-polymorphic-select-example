class Show < ActiveRecord::Base
	# the table name is the plural of class name which is Show
	# shows

	validates :title, :presence => true,
	                  :length => { :minimum => 5 }
end
