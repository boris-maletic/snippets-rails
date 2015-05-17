require 'rails_helper'

RSpec.describe SnippetsController, :type => :controller do
  let(:user) { User.create(username: 'user123', email: 'user123@example.com', password: 'password') }
  let(:snippet) { Snippet.create(user: user, filename: 'test.rb', content: 'puts "A"') }

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

    describe "GET 'edit'" do
      it 'redirects' do
        get :edit, id: 42
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "GET 'mine'" do
      it 'redirects' do
        get :mine
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST 'create'" do
      it 'redirects' do
        post :create, { some: 'thing' }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "PUT 'update'" do
      it 'redirects' do
        put :update, id: snippet.id, snippet: { filename: 'new_filename.rs', content: '...' }
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
        expect(assigns[:snippets]).not_to be_nil
      end
    end

    describe "POST 'create'" do
      it 'creates a new snippet and redirects' do
        data = { snippet: { filename: 'test.rb', content: 'puts "Hello!"' } }
        expect { post :create, data }.to change { Snippet.count }.by(1)
        expect(response).to redirect_to(mine_snippets_path)
      end
    end

    describe "GET 'edit'" do
      it 'redirects' do
        get :edit, id: snippet.id
        expect(response).to be_success
        expect(assigns[:snippet]).not_to be_nil
      end
    end
    
    describe "PUT 'update'" do
      it 'updates the snippet and redirects' do
        new_filename = 'new_filename.rs'
        new_content = 'New content'
        put :update, id: snippet.id, snippet: { filename: new_filename, content: new_content }
        expect(snippet.reload.filename).to eq(new_filename)
        expect(snippet.content).to eq(new_content)
        expect(response).to redirect_to(mine_snippets_path)
      end
    end

  end

end
