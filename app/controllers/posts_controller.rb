class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_owner = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: 'Not Authorized To Edit This Post' if @post.nil?
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
