class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authorization_user, only: [:destroy]
  before_action :checkOwnership, only: [:edit, :update]

  # GET /posts
  def index
    @posts = Post.all
    if params[:search].present?
      case params[:type]
      when "tag"
        @posts = Post.findByTag(params[:search])
      when "category"
        @posts = Post.findByCategory(params[:search])
      when "title"
        @posts = Post.findByTitle(params[:search])
      else
        @posts = Post.all
      end
    end
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update

    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    redirect_to posts_url, notice: "Post was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :tag, :category, :user_id, :status)
    end

    def authorization_user
      if current_user.role != "admin"
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end

    def checkOwnership
      if current_user.id != @post.user_id
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end
end
