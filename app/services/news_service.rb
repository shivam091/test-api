# encoding: utf-8
# frozen_string_literal: true

class NewsService
  include Callable

  attr_accessor :api_key

  BASE_URL = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey="

  def initialize(api_key:)
    @api_key = api_key
  end

  def call
    begin
      news = fetch_news
      create_news(news)
      ServiceResponse.success(message: "All news fetched")
    rescue RestClient::Unauthorized => exception
      ServiceResponse.error(message: "Failed to fetch news", payload: { exception: exception.to_s })
    rescue RestClient::Exceptions::Timeout => exception
      ServiceResponse.error(message: "Failed to fetch news due to timeout", payload: { exception: exception.to_s })
    end
  end

  private

  def fetch_news
    news = JSON.parse(RestClient.get(BASE_URL + @api_key, timeout: 1))["articles"]
    news
  end

  def create_news(news)
    news.each do |news|
      ::News.find_or_create_by(title: news["title"]) do |news|
        news.author = news["author"],
        news.description = news["description"],
        news.url = news["url"],
        news.image_url = news["urlToImage"],
        news.published_at = news["publishedAt"],
        news.content = news["content"]
      end
    end
  end
end
