require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid when it has all required attributes' do
      user = User.new(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).to be_valid 
    end
  
    it 'is invalid when password length is shorter than 3' do
      user = User.new(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "AB", password_confirmation: "AB")
      expect(user).not_to be_valid 
    end

    it 'is invalid when password is missing' do
      user = User.new(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com")
      expect(user).not_to be_valid 
    end
  
    it 'is invalid when email is already used to create an user account' do
      user1 = User.create(first_name: "Jean", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc") 
      user2 = User.new(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user2).not_to be_valid 
    end

    it 'is invalid when email is missing' do
      user = User.new(first_name: "J", last_name: "Doe", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).not_to be_valid 
    end

    it 'is invalid when password first name is shorter than 3' do
      user = User.new(first_name: "J", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).not_to be_valid 
    end

    it 'is invalid when password first name is missing' do
      user = User.new(last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).not_to be_valid 
    end

    it 'is invalid when password last name is shorter than 3' do
      user = User.new(first_name: "John", last_name: "D", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).not_to be_valid 
    end

    it 'is invalid when password last name is missing' do
      user = User.new(first_name: "John", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user).not_to be_valid 
    end

  end

  
  describe '.authenticate_with_credentials' do

    it 'equals when a user has correct email and password' do
      user = User.create(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user.authenticate_with_credentials("johndoe@gmail.com", "ABC123abc")).to eql(user)
    end

    it 'does not equal when a user has incorrect email and correct password' do
      user = User.create(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user.authenticate_with_credentials("johndoe@hotmail.com", "ABC123abc")).not_to eql(user)
    end

    it 'does not equal when a user has correct email and incorrect password' do
      user = User.create(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user.authenticate_with_credentials("johndoe@gmail.com", "ABCD123abcd")).not_to eql(user)
    end

    it 'equals when a user has correct email (non-case sensitive) and password' do
      user = User.create(first_name: "John", last_name: "Doe", email:"johndoe@gmail.com", password: "ABC123abc", password_confirmation: "ABC123abc")
      expect(user.authenticate_with_credentials("JOHNDOE@gmail.com", "ABC123abc")).to eql(user)
    end

  end




end
