class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def mine
    @snippets = Snippet.where(user: current_user).order(updated_at: :desc)
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to mine_snippets_url, notice: 'Snippet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @snippet = Snippet.find(params[:id])
    authorize @snippet
  end

  def update
    @snippet = Snippet.find(params[:id])
    authorize @snippet
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to mine_snippets_url, notice: 'Snippet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    authorize @snippet
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to mine_snippets_url, notice: 'Snippet was successfully deleted.' }
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:filename, :content)
  end
end
