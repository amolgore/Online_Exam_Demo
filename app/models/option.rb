class Option < ActiveRecord::Base
  belongs_to :questions
  has_many :answers
end
