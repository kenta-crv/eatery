class EateriesController < ApplicationController
  before_action :set_search
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

      when "french" then
        @eateries = Eatery.where(genre: "フレンチ").page(params[:page]).per(20)
      when "innovate" then
        @eateries = Eatery.where(genre: "イノベーティブ・フュージョン").page(params[:page]).per(20)
      when "bistro" then
        @eateries = Eatery.where(genre: "ビストロ").page(params[:page]).per(20)
      when "bar" then
        @eateries = Eatery.where(genre: "バル").page(params[:page]).per(20)
      when "italian" then
        @eateries = Eatery.where(genre: "イタリアン").page(params[:page]).per(20)
      when "pizza" then
        @eateries = Eatery.where(genre: "ピザ").page(params[:page]).per(20)
      when "spanish" then
        @eateries = Eatery.where(genre: "スペイン料理").page(params[:page]).per(20)
      when "asia" then
        @eateries = Eatery.where(genre: "アジア料理").page(params[:page]).per(20)
      when "chinese" then
        @eateries = Eatery.where(genre: "中華料理").page(params[:page]).per(20)
      when "washoku" then
        @eateries = Eatery.where(genre: "日本料理・割烹料理").page(params[:page]).per(20)
      when "tempura" then
        @eateries = Eatery.where(genre: "天ぷら").page(params[:page]).per(20)
      when "yakitori" then
        @eateries = Eatery.where(genre: "焼き鳥").page(params[:page]).per(20)
      when "yakiniku" then
        @eateries = Eatery.where(genre: "焼肉").page(params[:page]).per(20)
      when "steak" then
        @eateries = Eatery.where(genre: "ステーキ・しゃぶしゃぶ").page(params[:page]).per(20)
      when "gyoza" then
        @eateries = Eatery.where(genre: "餃子").page(params[:page]).per(20)
      when "sushi" then
        @eateries = Eatery.where(genre: "寿司").page(params[:page]).per(20)
      when "sushi2" then
        @eateries = Eatery.where(genre: "鮨").page(params[:page]).per(20)
      when "local" then
        @eateries = Eatery.where(genre: "郷土料理").page(params[:page]).per(20)
      when "western" then
        @eateries = Eatery.where(genre: "洋食").page(params[:page]).per(20)
      when "wagashi" then
        @eateries = Eatery.where(genre: "和菓子").page(params[:page]).per(20)
      when "chaya" then
        @eateries = Eatery.where(genre: "茶屋").page(params[:page]).per(20)
      when "cafe" then
        @eateries = Eatery.where(genre: "カフェ").page(params[:page]).per(20)
      when "sweets" then
        @eateries = Eatery.where(genre: "スイーツ").page(params[:page]).per(20)
      when "bar2" then
        @eateries = Eatery.where(genre: "バー").page(params[:page]).per(20)
      when "curry" then
        @eateries = Eatery.where(genre: "カレー").page(params[:page]).per(20)
      when "tonkatsu" then
        @eateries = Eatery.where(genre: "とんかつ").page(params[:page]).per(20)
      when "izakaya" then
        @eateries = Eatery.where(genre: "居酒屋").page(params[:page]).per(20)
      when "seafood" then
        @eateries = Eatery.where(genre: "海鮮料理").page(params[:page]).per(20)
      when "unagi" then
        @eateries = Eatery.where(genre: "鰻料理").page(params[:page]).per(20)
      when "hanburg" then
        @eateries = Eatery.where(genre: "ハンバーグ").page(params[:page]).per(20)
      when "set" then
        @eateries = Eatery.where(genre: "定食").page(params[:page]).per(20)
      when "okonomiyaki" then
        @eateries = Eatery.where(genre: "お好み焼き").page(params[:page]).per(20)
      when "other" then
        @eateries = Eatery.where(genre: "その他").page(params[:page]).per(20)

      when "date" then
        @eateries = Eatery.where(situation: "デート").page(params[:page]).per(20)
      when "lunch" then
        @eateries = Eatery.where(situation: "ランチ").page(params[:page]).per(20)
      when "casual" then
        @eateries = Eatery.where(situation: "カジュアル").page(params[:page]).per(20)
      when "fomal" then
        @eateries = Eatery.where(situation: "フォーマル").page(params[:page]).per(20)
      when "fashion" then
        @eateries = Eatery.where(situation: "ファッション").page(params[:page]).per(20)
      when "recommend" then
        @eateries = Eatery.where(situation: "eatery japan recommend").page(params[:page]).per(20)
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

    def prefecture
      @q = Eatery.ransack(params[:q])
      @eateries = @q.result
      @eateries = @eateries.page(params[:page]).per(20).order(created_at: :desc)
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
        situation: [],
        genre: []
        )
    end
end
