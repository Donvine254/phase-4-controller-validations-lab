class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def show
    post = Post.find(params[:id])
    
    render json: post
  end
  def create
    post = Post.create!(post_params)

    render json: post, status: :created
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end
  private 
  def render_unprocessable_entity(invalid)
    render json: { errors: { messages: invalid.record.errors.full_messages } }, status: :unprocessable_entity
  end

end
