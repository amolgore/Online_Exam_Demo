class Survey < ActiveRecord::Base
	scope :most_recent, -> { order("created_at desc") }
	has_many :questions ,:dependent => :destroy
	accepts_nested_attributes_for :questions, :allow_destroy => true
end
