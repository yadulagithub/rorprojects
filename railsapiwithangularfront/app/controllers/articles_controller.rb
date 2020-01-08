class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
     @articles = Article.all
     # following is for angular front end
     # instead of rendering to view we are providing jspn object 
     render json: @articles
  end

  # def index
  #   render json: { data: article_list.to_json }
  # end

  # GET /articles/1
  # GET /articles/1.json
  def show
    render json: @article
  end

  # GET /articles/new
  def new
    @article = Article.new
    render json: @article
  end

  # GET /articles/1/edit
  def edit
    render json: @article
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    # respond_to do |format|
    #    if @article.save
    #      #format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #      format.json { render :show, status: :created, location: @article }
    #    else
    #      #format.html { render :new }
    #      format.json { render json: @article.errors, status: :unprocessable_entity }
    #    end
    # end

    if @article.save
      render json: @article, status: :created, location: @article
    else
      # respond_with_errors(@article)
      render json: @article.errors , status: :unprocessable_entity 
    end

  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    #respond_to do |format|
       if @article.update(article_params)
    #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #     format.json { render json: @article, status: :ok, location: @article }
          render json: @article, status: :ok
        else
    #     format.html { render :edit }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
          render json: @article.errors , status: :unprocessable_entity 
        end
    # end
    

  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.destroy
       render json: :no_content , status: :ok
    else
       render json: @article.errors, status: :unprocessable_entity 
    end

    #respond_to do |format|
    #   format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    
    # render json: @article
    # render json: { head :no_content }
  end

  private

  def article_list
    @article_list = Article.order(:id)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :slug)
    end
end
