require 'rails_helper'

RSpec.describe SnippetsController, :type => :controller do
  let(:user) { User.create(username: 'user123', email: 'user123@example.com', password: 'password') }

  context 'when not logged in' do
    describe "GET 'index'" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET 'new'" do
      it 'redirects' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "GET 'mine'" do
      it 'redirects' do
        get :mine
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when logged in' do
    before { sign_in user }
    
    describe "GET 'new'" do
      it "returns http success" do
        get :new
        expect(response).to be_success
      end
    end
    
    describe "GET 'mine'" do
      it "returns http success" do
        get :mine
        expect(response).to be_success
      end
    end

  end

end
