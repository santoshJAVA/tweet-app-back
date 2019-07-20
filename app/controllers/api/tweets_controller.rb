class Api::TweetsController < ApplicationController
  before_action :set_tweet, only: %i(show)

  def index
    render json: Tweet.select(:id, :content, :user)
  end

  def show
    user_email = @tweet.user.email
    render json: @tweet.as_json(only: %i(id content user_email))
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
