class RecommendsController < ApplicationController
  before_action :set_search

  def index
    @type = params[:type]
    @reviews = @q.result.page(params[:page]).per(20)
    case @type
    when "gift" then
      @reviews = Review.published.joins(:eatery).where("eateries.situation = ?", "デート").order("reviews.delicious_score DESC").limit(10)
    when "tokyo_french" then
      @reviews = Review.published.joins(:eatery).where("eateries.genre = ?", "フレンチ").order("reviews.delicious_score DESC").limit(10)
    else
      @reviews = Review.published.order("created_at DESC").page(params[:page]).per(20)
    end
  end

  def set_search
    @q = Eatery.ransack(params[:q])
    @eateries = @q.result
    @eateries = @eateries.all.order(created_at: 'desc')
  end
end
