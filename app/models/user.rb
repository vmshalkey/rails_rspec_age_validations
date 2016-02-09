class User < ActiveRecord::Base
	validates :first_name, :last_name, :age, presence: true
	validates :first_name, :last_name, length: { minimum: 2 }
	validates :age, numericality: { only_interger: true, greater_than_or_equal_to: 10, less_than: 150 }
end
