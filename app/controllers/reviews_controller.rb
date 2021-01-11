class ReviewsController < ApplicationController
    before_action :set_search
    before_action :set_eatery
    before_action :set_review, only: [:edit, :update, :destroy, :new]
    before_action :set_user
    #before_action :set_review, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
      @type = params[:type]
      @reviews = @q.result.page(params[:page]).per(20)
      case @type
      when "reccomend" then
        @reviews = Review.published.where(revisit: 1).order("created_at DESC").page(params[:page]).per(20)
      when "delicious_score" then
        @reviews = Review.published.order("delicious_score DESC").page(params[:page]).per(20)
      when "mood_score" then
        @reviews = Review.published.order("mood_score DESC").page(params[:page]).per(20)
      when "cost_performance_score" then
        @reviews = Review.published.order("cost_performance_score DESC").page(params[:page]).per(20)
      when "service_score" then
        @reviews = Review.published.order("service_score DESC").page(params[:page]).per(20)
      when "imagination_score" then
        @reviews = Review.published.order("imagination_score DESC").page(params[:page]).per(20)
      when "total_score" then
        @reviews = Review.published.order("total_score DESC").page(params[:page]).per(20)
      else
        @reviews = Review.published.order("created_at DESC").page(params[:page]).per(20)
      end
    end

    def show
      @eatery = Eatery.find(params[:eatery_id])
      @review = Review.find_by(id: params[:id], eatery_id: @eatery.id)
    end

    def new
      @review = @current_eatery.reviews.build
      #@review = Review.new
      #@eatery = Eatery.find(params[:eatery_id])
    end

    def create
      #@eatery = Eatery.find(params[:eatery_id])
      #@review = Review.new(review_params)
      #if @review.save
      #  redirect_to reviews_path
      #else
      #  render 'new'
      #end
      @review = @current_eatery.reviews.build(review_params)
      #if @review = @eatery.reviews.create(review_params)
      if @review.save
        redirect_to reviews_path
      else
        "new"
      end
    end

    def edit
      @review = Review.find(params[:id])
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
       redirect_to reviews_path
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to reviews_path
      else
        render 'edit'
      end
    end

    def review_import
      cnt = Review.review_import(params[:review_file])
      redirect_to reviews_url, notice:"#{cnt}件登録されました。"
    end

    def confirm
      @reviews = Review.draft.order("created_at DESC")
    end

    def set_search
      @q = Review.ransack(params[:q])
      @q = Eatery.ransack(params[:q])
      @reviews = @q.result
      @reviews = @reviews.all.order(created_at: 'desc')
    end

    private
    def set_review
      @review = @current_eatery.reviews.find_by(id: params[:id])
    end

    def review_params
      params.require(:review).permit(
        :delicious_score, #美味しさ
        :mood_score, #ムードスコア
        :cost_performance_score, #コストパフォーマンススコア
        :service_score, #サービススコア
        :imagination_score, #イマジネーションスコア
        :original1,
        :original1_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :original2,
        :original2_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :revisit, #再訪したいレベルか？
        :visited,
        :average_price, #平均金額
        :title, #タイトル
        :keyword, #キーワード
        :description, #説明
        :body, #本文
        :day,
        :select,
        :status,
        :image_1, #ファイル
        {image_2: []}
        )
    end
end
