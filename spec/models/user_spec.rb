require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should be invalid with no password' do
      user = User.new(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com")
      expect(user).to_not be_valid
      expect(user.errors[:password]).to(include("can't be blank"))
    end
    it 'should be invalid with no password confirmation' do
      user = User.new(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com")
      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to(include("can't be blank"))
    end
    it 'should be invalid with no first name' do
      user = User.new(first_name: nil, last_name: "Skywalker", email: "ls@ls.com", password: "ls", password_confirmation: "ls")
      expect(user).to_not be_valid
      expect(user.errors[:first_name]).to(include("can't be blank"))
    end
    it 'should be invalid with no last name' do
      user = User.new(first_name: "Luke", last_name: nil, email: "ls@ls.com", password: "ls", password_confirmation: "ls")
      expect(user).to_not be_valid
      expect(user.errors[:last_name]).to(include("can't be blank"))
    end
    it 'should have matching password and password_confirmation fields' do
      user = User.new(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "ls", password_confirmation: "ls")
      expect(user.password).to eq(user.password_confirmation)
    end
    it 'should be invalid with email missing' do
      user = User.new(first_name: "Luke", last_name: "Skywalker", email: nil, password: "ls", password_confirmation: "ls")
      expect(user).to_not be_valid
    end
    it 'should be invalid user because of unique email' do
      user1 = User.create(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "ls0000000", password_confirmation: "ls0000000")
      user2 = User.create(first_name: "Like", last_name: "Skywalker", email: "lS@lS.com", password: "ls0000000", password_confirmation: "ls0000000")
      expect(user2).to_not be_valid
      expect(user2.errors[:email]).to(include("has already been taken"))
    end
    it 'should not be valid without a minimum length password' do
      user = User.new(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: nil, password_confirmation: nil)
       expect(user).to_not be_valid
       expect(user.errors[:password]).to(include("is too short (minimum is 8 characters)"))
     end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate with correct credentials' do
      user = User.create!(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "lightsider", password_confirmation: "lightsider")
      result = User.authenticate_with_credentials("ls@ls.com", "lightsider")
      expect(result).to be_truthy
    end
    it 'should not authenticate with a bad password' do
      user = User.create!(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "lightsider", password_confirmation: "lightsider")
      result = User.authenticate_with_credentials("ls@ls.com", "darksider")
      expect(result).to be_falsy
    end
    it 'should not authenticate with an incorrect email' do
      user = User.create!(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "lightsider", password_confirmation: "lightsider")
      result = User.authenticate_with_credentials("ds@ds.com", "lightsider")
      expect(result).to be_falsy
    end
    it 'should authenticate with an email that has whitespace' do
      user = User.create!(first_name: "Luke", last_name: "Skywalker", email: "ls@ls.com", password: "lightsider", password_confirmation: "lightsider")
      result = User.authenticate_with_credentials(" ls@ls.com ", "lightsider")
      expect(result).to be_truthy
    end
    it 'should authenticate with an email that has lowercase and uppercase' do
      user = User.create!(first_name: "Luke", last_name: "Skywalker", email: "lS@lS.com", password: "lightsider", password_confirmation: "lightsider")
      result = User.authenticate_with_credentials("Ls@Ls.com", "lightsider")
      expect(result).to be_truthy
    end
  end

end
