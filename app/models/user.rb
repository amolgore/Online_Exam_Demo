class User < ActiveRecord::Base
  	rolify

	has_many :answers
  	has_many :questions, through: :answers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
