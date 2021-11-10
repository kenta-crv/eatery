class ReviewsController < ApplicationController
    #before_action :set_prefecture
    #before_action :set_search
    #before_action :set_Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC")
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
        @headline = "美味しさランキング"
      when "mood_score" then
        @reviews = Review.published.order("mood_score DESC").page(params[:page]).per(20)
        @headline = "雰囲気ランキング"
      when "cost_performance_score" then
        @reviews = Review.published.order("cost_performance_score DESC").page(params[:page]).per(20)
        @headline = "コストパフォーマンスランキング"
      when "service_score" then
        @reviews = Review.published.order("service_score DESC").page(params[:page]).per(20)
        @headline = "サービスランキング"
      when "imagination_score" then
        @reviews = Review.published.order("imagination_score DESC").page(params[:page]).per(20)
        @headline = "創造性ランキング"
      when "total_score" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").page(params[:page]).per(20)
        @headline = "トータルスコアランキング"
      when "hokkaido" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "北海道").page(params[:page]).per(20)
        @headline = "北海道おすすめグルメランキング"
      when "aomori" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "青森県").page(params[:page]).per(20)
        @headline = "青森県おすすめグルメランキング"
      when "akita" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "秋田県").page(params[:page]).per(20)
        @headline = "秋田県おすすめグルメランキング"
      when "iwate" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "岩手県").page(params[:page]).per(20)
        @headline = "岩手県おすすめグルメランキング"
      when "yamagata" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "山形県").page(params[:page]).per(20)
        @headline = "山形県おすすめグルメランキング"
      when "miyagi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "宮城県").page(params[:page]).per(20)
        @headline = "宮城県おすすめグルメランキング"
      when "fukushima" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "福島県").page(params[:page]).per(20)
        @headline = "福島県おすすめグルメランキング"
      when "ibaraki" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "茨城県").page(params[:page]).per(20)
        @headline = "茨城県おすすめグルメランキング"
      when "tochigi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "栃木県").page(params[:page]).per(20)
        @headline = "栃木県おすすめグルメランキング"
      when "gunma" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "群馬県").page(params[:page]).per(20)
        @headline = "群馬県おすすめグルメランキング"
      when "tokyo" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "東京都").page(params[:page]).per(20)
        @headline = "東京都おすすめグルメランキング"
      when "kanagawa" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "神奈川県").page(params[:page]).per(20)
        @headline = "神奈川県おすすめグルメランキング"
      when "saitama" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "埼玉県").page(params[:page]).per(20)
        @headline = "埼玉県おすすめグルメランキング"
      when "chiba" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "千葉県").page(params[:page]).per(20)
        @headline = "千葉県おすすめグルメランキング"
      when "niigata" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "新潟県").page(params[:page]).per(20)
        @headline = "新潟県おすすめグルメランキング"
      when "yamanashi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "山梨県").page(params[:page]).per(20)
        @headline = "山梨県おすすめグルメランキング"
      when "nagano" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "長野県").page(params[:page]).per(20)
        @headline = "長野県おすすめグルメランキング"
      when "ishikawa" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "石川県").page(params[:page]).per(20)
        @headline = "石川県おすすめグルメランキング"
      when "toyama" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "富山県").page(params[:page]).per(20)
        @headline = "富山県おすすめグルメランキング"
      when "fukui" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "福井県").page(params[:page]).per(20)
        @headline = "福井県おすすめグルメランキング"
      when "shizuoka" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "静岡県").page(params[:page]).per(20)
        @headline = "静岡県おすすめグルメランキング"
      when "aichi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "愛知県").page(params[:page]).per(20)
        @headline = "愛知県おすすめグルメランキング"
      when "gifu" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "岐阜県").page(params[:page]).per(20)
        @headline = "岐阜県おすすめグルメランキング"
      when "mie" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "三重県").page(params[:page]).per(20)
        @headline = "三重県おすすめグルメランキング"
      when "wakayama" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "和歌山県").page(params[:page]).per(20)
        @headline = "和歌山県おすすめグルメランキング"
      when "nara" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "奈良県").page(params[:page]).per(20)
        @headline = "奈良県おすすめグルメランキング"
      when "shiga" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "滋賀県").page(params[:page]).per(20)
        @headline = "滋賀県おすすめグルメランキング"
      when "kyoto" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "京都府").page(params[:page]).per(20)
        @headline = "京都府おすすめグルメランキング"
      when "osaka" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "大阪府").page(params[:page]).per(20)
        @headline = "大阪府おすすめグルメランキング"
      when "hyogo" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "兵庫県").page(params[:page]).per(20)
        @headline = "兵庫県おすすめグルメランキング"
      when "okayama" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "岡山県").page(params[:page]).per(20)
        @headline = "岡山県おすすめグルメランキング"
      when "hiroshima" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "広島県").page(params[:page]).per(20)
        @headline = "広島県おすすめグルメランキング"
      when "tottori" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "鳥取県").page(params[:page]).per(20)
        @headline = "鳥取県おすすめグルメランキング"
      when "shimane" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "島根県").page(params[:page]).per(20)
        @headline = "島根県おすすめグルメランキング"
      when "yamaguchi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "山口県").page(params[:page]).per(20)
        @headline = "山口県おすすめグルメランキング"
      when "kouchi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "高知県").page(params[:page]).per(20)
        @headline = "高知県おすすめグルメランキング"
      when "ehime" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "愛媛県").page(params[:page]).per(20)
        @headline = "愛媛県おすすめグルメランキング"
      when "tokushima" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "徳島県").page(params[:page]).per(20)
        @headline = "徳島県おすすめグルメランキング"
      when "kagawa" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "香川県").page(params[:page]).per(20)
        @headline = "香川県おすすめグルメランキング"
      when "fukuoka" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "福岡県").page(params[:page]).per(20)
        @headline = "福岡県おすすめグルメランキング"
      when "ooita" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "大分県").page(params[:page]).per(20)
        @headline = "大分県おすすめグルメランキング"
      when "saga" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "佐賀県").page(params[:page]).per(20)
        @headline = "佐賀県おすすめグルメランキング"
      when "nagasaki" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "長崎県").page(params[:page]).per(20)
        @headline = "長崎県おすすめグルメランキング"
      when "kumamoto" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "熊本県").page(params[:page]).per(20)
      when "miyazaki" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "宮崎県").page(params[:page]).per(20)
        @headline = "宮崎県おすすめグルメランキング"
      when "kagoshima" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "鹿児島県").page(params[:page]).per(20)
        @headline = "鹿児島県おすすめグルメランキング"
      when "okinawa" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where("prefecture": "沖縄県").page(params[:page]).per(20)
        @headline = "沖縄県おすすめグルメランキング"
      when "french" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "フレンチ").page(params[:page]).per(20)
        @headline = "フレンチおすすめグルメランキング"
      when "innovate" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "イノベーティブ・フュージョン").page(params[:page]).per(20)
        @headline = "イノベーティブフュージョンおすすめグルメランキング"
      when "bistro" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "ビストロ").page(params[:page]).per(20)
        @headline = "ビストロおすすめグルメランキング"
      when "bar" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "バル").page(params[:page]).per(20)
        @headline = "バルおすすめグルメランキング"
      when "italian" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "イタリアン").page(params[:page]).per(20)
        @headline = "イタリアンおすすめグルメランキング"
      when "pizza" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "ピザ").page(params[:page]).per(20)
        @headline = "ピザおすすめグルメランキング"
      when "spanish" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "スペイン料理").page(params[:page]).per(20)
        @headline = "スペイン料理おすすめグルメランキング"
      when "asia" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "アジア料理").page(params[:page]).per(20)
        @headline = "アジア料理おすすめグルメランキング"
      when "chinese" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "中華料理").page(params[:page]).per(20)
        @headline = "中華料理おすすめグルメランキング"
      when "washoku" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "日本料理・割烹料理").page(params[:page]).per(20)
        @headline = "日本料理・割烹料理おすすめグルメランキング"
      when "tempura" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "天ぷら").page(params[:page]).per(20)
        @headline = "天ぷらおすすめグルメランキング"
      when "yakitori" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "焼き鳥").page(params[:page]).per(20)
        @headline = "焼き鳥おすすめグルメランキング"
      when "yakiniku" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "焼肉").page(params[:page]).per(20)
        @headline = "焼肉おすすめグルメランキング"
      when "steak" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "ステーキ・しゃぶしゃぶ").page(params[:page]).per(20)
        @headline = "ステーキ・しゃぶしゃぶおすすめグルメランキング"
      when "gyoza" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "餃子").page(params[:page]).per(20)
        @headline = "餃子おすすめグルメランキング"
      when "sushi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "寿司").page(params[:page]).per(20)
        @headline = "寿司おすすめグルメランキング"
      when "sushi2" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "鮨").page(params[:page]).per(20)
        @headline = "鮨おすすめグルメランキング"
      when "local" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "郷土料理").page(params[:page]).per(20)
        @headline = "郷土料理おすすめグルメランキング"
      when "western" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "洋食").page(params[:page]).per(20)
        @headline = "洋食おすすめグルメランキング"
      when "wagashi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "和菓子").page(params[:page]).per(20)
        @headline = "和菓子おすすめグルメランキング"
      when "chaya" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "茶屋").page(params[:page]).per(20)
        @headline = "茶屋おすすめグルメランキング"
      when "cafe" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "カフェ").page(params[:page]).per(20)
        @headline = "カフェおすすめグルメランキング"
      when "sweets" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "スイーツ").page(params[:page]).per(20)
        @headline = "スイーツおすすめグルメランキング"
      when "bar2" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "バー").page(params[:page]).per(20)
        @headline = "バーおすすめグルメランキング"
      when "curry" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "カレー").page(params[:page]).per(20)
        @headline = "カレーおすすめグルメランキング"
      when "tonkatsu" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "とんかつ").page(params[:page]).per(20)
        @headline = "とんかつおすすめグルメランキング"
      when "izakaya" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "居酒屋").page(params[:page]).per(20)
        @headline = "居酒屋おすすめグルメランキング"
      when "seafood" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "海鮮料理").page(params[:page]).per(20)
        @headline = "海鮮料理おすすめグルメランキング"
      when "unagi" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "鰻料理").page(params[:page]).per(20)
        @headline = "鰻料理おすすめグルメランキング"
      when "hanburg" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "ハンバーグ").page(params[:page]).per(20)
        @headline = "ハンバーグおすすめグルメランキング"
      when "set" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "定食").page(params[:page]).per(20)
        @headline = "定食おすすめグルメランキング"
      when "okonomiyaki" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "お好み焼き").page(params[:page]).per(20)
        @headline = "お好み焼きおすすめグルメランキング"
      when "other" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(genre: "その他").page(params[:page]).per(20)
        @headline = "その他おすすめグルメランキング"

      when "date" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "デート").page(params[:page]).per(20)
        @headline = "デートにおすすめグルメランキング"
      when "fashion" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "おしゃれ").page(params[:page]).per(20)
        @headline = "おしゃれなおすすめグルメランキング"
      when "onry" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "一人で入りやすい").page(params[:page]).per(20)
        @headline = "一人で入りやすいおすすめグルメランキング"
      when "formal" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "接待").page(params[:page]).per(20)
        @headline = "接待に使えるおすすめグルメランキング"
      when "many" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "大人数").page(params[:page]).per(20)
        @headline = "大人数で使えるおすすめグルメランキング"
      when "casual" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "カジュアル").page(params[:page]).per(20)
        @headline = "カジュアル利用におすすめグルメランキング"
      when "walk" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "食べ歩き").page(params[:page]).per(20)
        @headline = "食べ歩きおすすめグルメランキング"
      when "old" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "老舗").page(params[:page]).per(20)
        @headline = "歴史感じる老舗おすすめグルメランキング"
      when "lunch" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "ランチ").page(params[:page]).per(20)
        @headline = "ランチおすすめグルメランキング"
      when "restaurant" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "レストラン").page(params[:page]).per(20)
        @headline = "レストランおすすめグルメランキング"
      when "souvenir" then
        @reviews = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").where(situation: "お土産").page(params[:page]).per(20)
        @headline = "お土産おすすめグルメランキング"
      else
        @reviews = @q.result.page(params[:page]).where(status: "published").order("created_at DESC").per(20)
        @headline = "おすすめグルメランキング"
      end
    end

    def show
      @review = Review.find(params[:id])
      render :layout => "slider"
      #@Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC") = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").find(params[:Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC")_id])
      #@review = Review.find_by(id: params[:id], Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC")_id: @Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").id)
    end

    def new
      @review = Review.new
      render :layout => "froala"
      #@review = Review.new
      #@Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC") = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").find(params[:Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC")_id])
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
      render :layout => "froala"
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
      @q = Review.published.order("(delicious_score + mood_score  + cost_performance_score  + service_score  + imagination_score) DESC").ransack(params[:q])
      @reviews = @q.result.page(params[:page]).per(20)
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
        image_2: [],
        situation: [],
        genre: []
        )
    end
end
