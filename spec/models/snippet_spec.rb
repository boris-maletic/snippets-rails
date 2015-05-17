require 'rails_helper'

RSpec.describe Snippet, :type => :model do
  let(:valid_snippet) do
    Snippet.new(user_id: 42, filename: 'test.rb', content: 'puts "Hello!"')
  end
  let(:snippet) { valid_snippet }

  before { expect(valid_snippet).to be_valid }

  describe '#user_id' do
    it "is required" do
      snippet.user_id = nil
      expect(snippet).not_to be_valid
    end
  end

  describe '#filename' do
    it 'is required' do
      snippet.filename = nil
      expect(snippet).not_to be_valid

      snippet.filename = '   '
      expect(snippet).not_to be_valid
    end
  end

  describe '#content' do
    it 'is required' do
      snippet.content = nil
      expect(snippet).not_to be_valid

      snippet.content = ''
      expect(snippet).not_to be_valid
    end
  end
end
