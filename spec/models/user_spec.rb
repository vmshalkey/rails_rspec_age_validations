require 'rails_helper'

RSpec.describe User, type: :model do
	it "requires a first name" do
		user = User.new(first_name: "")
		#populates errors
		user.valid?
		expect(user.errors[:first_name].any?).to eq(true)
	end
	it "requires a last name" do
		user = User.new(last_name: "")
		user.valid?
		expect(user.errors[:last_name].any?).to eq(true)
	end
	it "requires an age to be numeric" do
		user = User.new(age: "hello")
		user.valid?
		expect(user.errors[:age].any?).to eq(true)
	end
	it "requires first name to be at least 2 characters" do
		user1 = User.new(first_name: "Fred")
		user2 = User.new(first_name: "J")
		[user1, user2].each { |u| u.valid? }
		expect(user1.errors[:first_name].any?).to eq(false)
		expect(user2.errors[:first_name].any?).to eq(true)
	end
	it "requires last name to be at least 2 characters" do
		user1 = User.new(last_name: "Jones")
		user2 = User.new(last_name: "J")
		[user1, user2].each { |u| u.valid? }
		expect(user1.errors[:last_name].any?).to eq(false)
		expect(user2.errors[:last_name].any?).to eq(true)
	end
	it "requires age to be at least 10 and below 150" do
		user1 = User.new(age: 12)
		user2 = User.new(age: 9)
		user3 = User.new(age: 151)
		[user1, user2, user3].each { |u| u.valid? }
		expect(user1.errors[:age].any?).to eq(false)
		expect(user2.errors[:age].any?).to eq(true)
		expect(user3.errors[:age].any?).to eq(true)
	end
end
