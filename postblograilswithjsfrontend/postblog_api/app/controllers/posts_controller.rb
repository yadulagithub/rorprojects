class PostsController < ApplicationController
  before_action :set_author, :set_post, only: [:show, :edit, :update, :destroy]

#   Prefix            Verb   URI Pattern                                                    Controller#Action
#   author_posts      GET    /authors/:author_id/posts(.:format)                            posts#index
#                     POST   /authors/:author_id/posts(.:format)                            posts#create
#   new_author_post   GET    /authors/:author_id/posts/new(.:format)                        posts#new
#   edit_author_post  GET    /authors/:author_id/posts/:id/edit(.:format)                   posts#edit
#   author_post       GET    /authors/:author_id/posts/:id(.:format)                        posts#show
#                     PATCH  /authors/:author_id/posts/:id(.:format)                        posts#update
#                     PUT    /authors/:author_id/posts/:id(.:format)                        posts#update
#                     DELETE /authors/:author_id/posts/:id(.:format)                        posts#destroy

#   # GET /posts
# GET /posts.json
  def index
    @posts = Post.all.where(author_id: params[:author_id])
    render json: @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    render json: @posts
  end

  # GET /posts/new
  def new
    
    # following is when you are passind only author id from Idex of author screen
    # <td><%= link_to 'New Post', new_post_path(:author_id => author.id)%></td>
    # puts "new"
    # puts params[:author_id]
    
    @post = Post.new
    @post.author_id = @author.id
    render json: @post
  end

  # GET /posts/1/edit
  def edit
    render json: @post
  end

  # POST /posts
  # POST /posts.json
  def create
      
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:author_id])
    end

    def set_post
      @post = Post.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :author_id, author_attributes: [:name])
    end

    def author_params
      params.require(:author).permit(:id, :name)
    end
end
