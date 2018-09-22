class PostsController < ApplicationController
  
  before_action :set_post, except: [:index, :create]

  def index
    render json: Post.all
  end

  def show
    render json: @post
  end

  def create
    post = Post.create(post_params)
    if post.save
      render json: post
    else
      render json: {errors: post.errors.full.messages.join(',')}, status: :bad_request
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: {errors: @post.errors.full.messages.join(',')}, status: :bad_request
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post)
  end
end
