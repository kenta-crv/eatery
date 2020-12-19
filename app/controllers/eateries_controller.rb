class EateriesController < ApplicationController
  layout 'eatery'
  before_action :set_eatery
  before_action :authenticate_admin!, except: [:index, :show]

    def index
      @q = Eatery.ransack(params[:q])
      @eateries = @q.result
      @eateries = @eateries.page(params[:page]).per(20).order(created_at: :desc)
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
      respond_to do |format|
       format.html
       format.csv{ send_data @eateries.generate_csv, filename: "eateries-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
      end
    end

    def show
      @eatery = Eatery.find(params[:id])
    end

    def new
    #@eatery = Eatery.find_by_canonical_name_or_id(params[:_canonical_name)
      @eatery = Eatery.new
    end

    def create
      #@eatery = Eatery.find_by_canonical_name_or_id(params[:_canonical_name)
      @eatery = Eatery.new(eatery_params)
      if @eatery.save
        redirect_to new_eatery_review_path(@eatery.id, @review)
      else
        render 'new'
      end
    end

    def edit
      @eatery = Eatery.find(params[:id])
    end

    def destroy
      @eatery = Eatery.find(params[:id])
      @eatery.destroy
       redirect_to eateries_path
    end

    def update
      @eatery = Eatery.find(params[:id])
      if @eatery.update(eatery_params)
        redirect_to eateries_path
      else
        render 'edit'
      end
    end

    def import
      cnt = Eatery.import(params[:file])
      redirect_to eateries_url, notice:"#{cnt}件登録されました。"
    end

    def set_search
      @q = Eatery.ransack(params[:q])
      @eateries = @q.result
      @eateries = @eateries.all.order(created_at: 'desc')
    end

    private
  #def load_eatery
  #    @eatery = Eatery.find(id: params[:id])
  #  end

    def eatery_params
      params.require(:eatery).permit(
        :store, #店舗名
        :store_kana,
        :url, #URL
        :tel, #電話番号
        :prefecture,
        :city,
        :town,
        :chome,
        :building,
        #:payment, #支払方法
         #ジャンル
        #:payment, #支払方法
        #:price_lunch, #ランチ単価
        #:price_dinner, #ディナー単価
        #:hour, #営業時間
        #:holiday, #定休日
        #:difficulty, #難易度
        #:bookking, #予約方法
        #:sit, #席数
        #:open, #オープン
        #:chef, #シェフ
        #:career, #キャリア
        #:remarks, #備考
        #:takeout,
        :file,
        #:image_1,
        #:image_2,

        genre: []
        )
    end
end
