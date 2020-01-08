class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
    # only want posts for the author 
    @posts = Post.where(author_id: params[:author_id])
    puts 'in Index'
    # author_name = params[:author_name]
    puts  params[:author_name]
    


  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    
    # following is when you are passind only author id from Idex of author screen
    # <td><%= link_to 'New Post', new_post_path(:author_id => author.id)%></td>
    puts "new"
    puts params[:author_id]
    
    @author = Author.find(params[:author_id])
    @post = Post.new
    @post.author_id = @author.id
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
       
    @post = Post.new(post_params)
    puts "in create"
    puts @post.author_id

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
