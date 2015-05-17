require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_user) { User.new(email: 'test@example.com', username: 'testuser', password: 'password') }
  let(:user) { valid_user }
  before { expect(valid_user).to be_valid }
  
  describe '#username' do
    it 'is required' do
      user.username = ''
      expect(user).not_to be_valid
    end

    it 'must be at least 6 characters long' do
      user.username = 'x' * 5
      expect(user).not_to be_valid
    end

    it 'must not be more than 20 characters long' do
      user.username = 'x' * 21
      expect(user).not_to be_valid
    end

    it 'must be unique' do
      user.save

      user2 = User.new(email: 'test2@example.com', username: user.username.downcase, password: 'password2')
      expect(user2).not_to be_valid

      user3 = User.new(email: 'test2@example.com', username: user.username.upcase, password: 'password2')
      expect(user3).not_to be_valid
    end
  end

  describe '#snippets association' do
    it { is_expected.to respond_to(:snippets) }
  end
end
