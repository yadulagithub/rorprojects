class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
#   Prefix Verb   URI Pattern                                                                       Controller#Action
#   root                      GET    /                                                              authors#index
#   author_post_comments      GET    /authors/:author_id/posts/:post_id/comments(.:format)          comments#index
#                             POST   /authors/:author_id/posts/:post_id/comments(.:format)          comments#create
#   new_author_post_comment   GET    /authors/:author_id/posts/:post_id/comments/new(.:format)      comments#new
#   edit_author_post_comment  GET    /authors/:author_id/posts/:post_id/comments/:id/edit(.:format) comments#edit
#   author_post_comment       GET    /authors/:author_id/posts/:post_id/comments/:id(.:format)      comments#show
#                             PATCH  /authors/:author_id/posts/:post_id/comments/:id(.:format)      comments#update
#                             PUT    /authors/:author_id/posts/:post_id/comments/:id(.:format)      comments#update
#                             DELETE /authors/:author_id/posts/:post_id/comments/:id(.:format)      comments#destroy

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    #@comments = Comment.where(post_id: params[:post_id])
    #@post = Post.find(params[:post_id])
    render json: @comments 
 
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render json: @comments
  end

  # GET /comments/new
  def new
    
    @comment = Comment.new
    render json: @comment
    
  end

  # GET /comments/1/edit
  def edit
    render json: @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
