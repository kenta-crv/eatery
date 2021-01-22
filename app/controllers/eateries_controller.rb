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
      when "hokkaido" then
        @eateries = Eatery.where(prefecture: "北海道").page(params[:page]).per(20)
      when "aomori" then
        @eateries = Eatery.where(prefecture: "青森県").page(params[:page]).per(20)
      when "akita" then
        @eateries = Eatery.where(prefecture: "秋田県").page(params[:page]).per(20)
      when "iwate" then
        @eateries = Eatery.where(prefecture: "岩手県").page(params[:page]).per(20)
      when "yamagata" then
        @eateries = Eatery.where(prefecture: "山形県").page(params[:page]).per(20)
      when "miyagi" then
        @eateries = Eatery.where(prefecture: "宮城県").page(params[:page]).per(20)
      when "fukushima" then
        @eateries = Eatery.where(prefecture: "福島県").page(params[:page]).per(20)
      when "ibaraki" then
        @eateries = Eatery.where(prefecture: "茨城県").page(params[:page]).per(20)
      when "tochigi" then
        @eateries = Eatery.where(prefecture: "栃木県").page(params[:page]).per(20)
      when "gunma" then
        @eateries = Eatery.where(prefecture: "群馬県").page(params[:page]).per(20)
      when "tokyo" then
        @eateries = Eatery.where(prefecture: "東京").page(params[:page]).per(20)
      when "kanagawa" then
        @eateries = Eatery.where(prefecture: "神奈川県").page(params[:page]).per(20)
      when "saitama" then
        @eateries = Eatery.where(prefecture: "埼玉県").page(params[:page]).per(20)
      when "chiba" then
        @eateries = Eatery.where(prefecture: "千葉県").page(params[:page]).per(20)
      when "niigata" then
        @eateries = Eatery.where(prefecture: "新潟県").page(params[:page]).per(20)
      when "yamanashi" then
        @eateries = Eatery.where(prefecture: "山梨県").page(params[:page]).per(20)
      when "nagano" then
        @eateries = Eatery.where(prefecture: "長野県").page(params[:page]).per(20)
      when "ishikawa" then
        @eateries = Eatery.where(prefecture: "石川県").page(params[:page]).per(20)
      when "toyama" then
        @eateries = Eatery.where(prefecture: "富山県").page(params[:page]).per(20)
      when "fukui" then
        @eateries = Eatery.where(prefecture: "福井県").page(params[:page]).per(20)
      when "shizuoka" then
        @eateries = Eatery.where(prefecture: "静岡県").page(params[:page]).per(20)
      when "aichi" then
        @eateries = Eatery.where(prefecture: "愛知県").page(params[:page]).per(20)
      when "gifu" then
        @eateries = Eatery.where(prefecture: "岐阜県").page(params[:page]).per(20)
      when "mie" then
        @eateries = Eatery.where(prefecture: "三重県").page(params[:page]).per(20)
      when "wakayama" then
        @eateries = Eatery.where(prefecture: "和歌山県").page(params[:page]).per(20)
      when "nara" then
        @eateries = Eatery.where(prefecture: "奈良県").page(params[:page]).per(20)
      when "shiga" then
        @eateries = Eatery.where(prefecture: "滋賀県").page(params[:page]).per(20)
      when "kyoto" then
        @eateries = Eatery.where(prefecture: "京都府").page(params[:page]).per(20)
      when "osaka" then
        @eateries = Eatery.where(prefecture: "大阪府").page(params[:page]).per(20)
      when "hyogo" then
        @eateries = Eatery.where(prefecture: "兵庫県").page(params[:page]).per(20)
      when "okayama" then
        @eateries = Eatery.where(prefecture: "岡山県").page(params[:page]).per(20)
      when "hiroshima" then
        @eateries = Eatery.where(prefecture: "広島県").page(params[:page]).per(20)
      when "tottori" then
        @eateries = Eatery.where(prefecture: "鳥取県").page(params[:page]).per(20)
      when "shimane" then
        @eateries = Eatery.where(prefecture: "島根県").page(params[:page]).per(20)
      when "yamaguchi" then
        @eateries = Eatery.where(prefecture: "山口県").page(params[:page]).per(20)
      when "kouchi" then
        @eateries = Eatery.where(prefecture: "高知県").page(params[:page]).per(20)
      when "ehime" then
        @eateries = Eatery.where(prefecture: "愛媛県").page(params[:page]).per(20)
      when "tokushima" then
        @eateries = Eatery.where(prefecture: "徳島県").page(params[:page]).per(20)
      when "kagawa" then
        @eateries = Eatery.where(prefecture: "香川県").page(params[:page]).per(20)
      when "fukuoka" then
        @eateries = Eatery.where(prefecture: "福岡県").page(params[:page]).per(20)
      when "ooita" then
        @eateries = Eatery.where(prefecture: "大分県").page(params[:page]).per(20)
      when "saga" then
        @eateries = Eatery.where(prefecture: "佐賀県").page(params[:page]).per(20)
      when "nagasaki" then
        @eateries = Eatery.where(prefecture: "長崎県").page(params[:page]).per(20)
      when "kumamoto" then
        @eateries = Eatery.where(prefecture: "熊本県").page(params[:page]).per(20)
      when "miyazaki" then
        @eateries = Eatery.where(prefecture: "宮崎県").page(params[:page]).per(20)
      when "kagoshima" then
        @eateries = Eatery.where(prefecture: "鹿児島県").page(params[:page]).per(20)
      when "okinawa" then
        @eateries = Eatery.where(prefecture: "沖縄県").page(params[:page]).per(20)

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
