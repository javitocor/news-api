class Api::V1::NewsController < ApplicationController
  before_action :set_provider, only: [:show]
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @news = New.all
      render json: @news
    else
      render json: {}, status: 401
    end
  end

  def create
    if user_signed_in? && current_user.admin?
      @new = current_user.news.build(new_params)
      if @new&.save
        render json: @new, status: :created
      else
        render json: { message: @new.errors.full_messages }, status: 400
      end
    else
      render json: {}, status: 401
    end
  end

  def show
    render json: @new
  end

  private

  def set_provider
    @new = New.find(params[:id])
  end

  def new_params
    params.require(:new).permit(:title, :content, :user_id)
  end
end
