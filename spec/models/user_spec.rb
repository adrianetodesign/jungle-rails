require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it 'Checks for vaild user' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      expect(user).to be_valid
    end

    describe 'Check if user passwords match' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      user.valid?
      it 'has user passwords that match' do
        expect(user.errors[:password_confirmation]).not_to be_present
      end
    end
  
    context "Check if user passwords don't match" do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'tatteredking')
      user.valid?
      it "Has user passwords that don't match" do
        expect(user.errors[:password_confirmation]).to be_present
      end
    end
  
    it 'Has a unique user email' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      user.save
      u = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      u.save
  
      expect(u.errors[:email].first).to eq('has already been taken')
    end
  
    it 'checks if password length less than 5 characters is invalid' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'king', password_confirmation: 'king')
      user.save
  
      expect(user).to be_invalid
    end
  
    it 'checks if password length is at-least 5 characters' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      user.save
  
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  
    it 'should aunthenticate user even if spaces are present in the email' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      user.save
      user = User.authenticate_with_credentials('  cassilda@carcosa.com  ', 'hyades')
  
      expect(user).not_to be(nil)
    end
  
    it 'should aunthenticate user even if spaces are present in the email' do
      user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
      user.save
      user = User.authenticate_with_credentials('CaSSilda@caRCoSa.coM', 'hyades')
  
      expect(user).not_to be(nil)
    end
  end
end
