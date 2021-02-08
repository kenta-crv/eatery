class RecommendsController < ApplicationController
  before_action :set_search

  def gift
    @reviews = Review.published.joins(:eatery).where("eatery.situation = ?", "situation").order("reviews.delicious_score DESC").limit(10)
  end

  def set_search
    @q = Eatery.ransack(params[:q])
    @eateries = @q.result
    @eateries = @eateries.all.order(created_at: 'desc')
  end
end
