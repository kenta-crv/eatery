class ReviewsController < ApplicationController
    #before_action :set_prefecture
    #before_action :set_search
    #before_action :set_eatery
    before_action :set_review, only: [:edit, :update, :destroy, :new]
    before_action :set_user
    #before_action :set_review, only: [:show,:edit,:update,:destroy]
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
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").page(params[:page]).per(20)
      when "hokkaido" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "北海道").page(params[:page]).per(20)
      when "aomori" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "青森県").page(params[:page]).per(20)
      when "akita" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "秋田県").page(params[:page]).per(20)
      when "iwate" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "岩手県").page(params[:page]).per(20)
      when "yamagata" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "山形県").page(params[:page]).per(20)
      when "miyagi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "宮城県").page(params[:page]).per(20)
      when "fukushima" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "福島県").page(params[:page]).per(20)
      when "ibaraki" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "茨城県").page(params[:page]).per(20)
      when "tochigi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "栃木県").page(params[:page]).per(20)
      when "gunma" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "群馬県").page(params[:page]).per(20)
      when "tokyo" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "東京都").page(params[:page]).per(20)
      when "kanagawa" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "神奈川県").page(params[:page]).per(20)
      when "saitama" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "埼玉県").page(params[:page]).per(20)
      when "chiba" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "千葉県").page(params[:page]).per(20)
      when "niigata" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "新潟県").page(params[:page]).per(20)
      when "yamanashi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "山梨県").page(params[:page]).per(20)
      when "nagano" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "長野県").page(params[:page]).per(20)
      when "ishikawa" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "石川県").page(params[:page]).per(20)
      when "toyama" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "富山県").page(params[:page]).per(20)
      when "fukui" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "福井県").page(params[:page]).per(20)
      when "shizuoka" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "静岡県").page(params[:page]).per(20)
      when "aichi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "愛知県").page(params[:page]).per(20)
      when "gifu" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "岐阜県").page(params[:page]).per(20)
      when "mie" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "三重県").page(params[:page]).per(20)
      when "wakayama" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "和歌山県").page(params[:page]).per(20)
      when "nara" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "奈良県").page(params[:page]).per(20)
      when "shiga" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "滋賀県").page(params[:page]).per(20)
      when "kyoto" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "京都府").page(params[:page]).per(20)
      when "osaka" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "大阪府").page(params[:page]).per(20)
      when "hyogo" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "兵庫県").page(params[:page]).per(20)
      when "okayama" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "岡山県").page(params[:page]).per(20)
      when "hiroshima" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "広島県").page(params[:page]).per(20)
      when "tottori" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "鳥取県").page(params[:page]).per(20)
      when "shimane" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "島根県").page(params[:page]).per(20)
      when "yamaguchi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "山口県").page(params[:page]).per(20)
      when "kouchi" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "高知県").page(params[:page]).per(20)
      when "ehime" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "愛媛県").page(params[:page]).per(20)
      when "tokushima" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "徳島県").page(params[:page]).per(20)
      when "kagawa" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "香川県").page(params[:page]).per(20)
      when "fukuoka" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "福岡県").page(params[:page]).per(20)
      when "ooita" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "大分県").page(params[:page]).per(20)
      when "saga" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "佐賀県").page(params[:page]).per(20)
      when "nagasaki" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "長崎県").page(params[:page]).per(20)
      when "kumamoto" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "熊本県").page(params[:page]).per(20)
      when "miyazaki" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "宮崎県").page(params[:page]).per(20)
      when "kagoshima" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "鹿児島県").page(params[:page]).per(20)
      when "okinawa" then
        @reviews = Review.published.with_total_score.order("total_score DESC").joins(:eatery).where("eateries.prefecture": "沖縄県").page(params[:page]).per(20)

    #  when "hokkaido" then
    #    @eateries = @reviews.where(eatery.prefecture: "北海道").page(params[:page]).per(20)
      else
        @reviews = @q.result.page(params[:page]).where(status: "published").order("created_at DESC").per(20)
      end
    end

    def show
      @review = Review.find(params[:id])
      render :layout => "slider"
      #@eatery = Eatery.find(params[:eatery_id])
      #@review = Review.find_by(id: params[:id], eatery_id: @eatery.id)
    end

    def new
      @review = Review.new
      render :layout => "froala"
      #@review = Review.new
      #@eatery = Eatery.find(params[:eatery_id])
    end

    def create
      @review = Review.new(review_params)
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

    def top
      #ランダムで行きたい３つを表示
      @reviews = Review.published.where(revisit: 1).order("RANDOM()").limit(3)
    end

    def set_prefecture
      @type = params[:type]
      @q = Eatery.ransack(params[:q])
      @eateries = @q.result.page(params[:page]).per(20)
    end


    private
    def set_review
      @review = Review.find_by(id: params[:id])
    end

    def review_params
      params.require(:review).permit(
        :store, #店舗名
        :store_kana,
        :url, #URL
        :tel, #電話番号
        :prefecture,
        :city,
        :town,
        :chome,
        :building,
        :delicious_score, #美味しさ
        :mood_score, #ムードスコア
        :cost_performance_score, #コストパフォーマンススコア
        :service_score, #サービススコア
        :imagination_score, #イマジネーションスコア
        :original1,
        :original1_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :original2,
        :original2_score, #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
        :total_score,
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
        {image_2: [],
        situation: [],
        genre: [],}
        )
    end
end
