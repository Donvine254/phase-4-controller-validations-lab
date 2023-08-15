class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end
  def update
    author = Author.find(params[:id])

    author.update!(author_params)

    render json: author, status: :accepted
  end
  private
  
  def author_params
    params.permit(:email, :name)
  end
  private 
  def render_unprocessable_entity(invalid)
    render json: { errors: { messages: invalid.record.errors.full_messages } }, status: :unprocessable_entity
  end
  
end
