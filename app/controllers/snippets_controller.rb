class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @snippet = Snippet.new
  end

  def mine
  end
end
