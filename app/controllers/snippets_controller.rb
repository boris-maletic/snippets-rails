class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def mine
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to mine_snippets_path, notice: 'Snippet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:filename, :content)
  end
end
