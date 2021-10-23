class Review < ApplicationRecord
  #belongs_to :eatery
  belongs_to :user, optional: true
  mount_uploader :image_1, FilesUploader
  mount_uploaders :image_2, ImagesUploader
  serialize :image_2, JSON

  #before_validation :set_total_score do
  #  self.total_score = delicious_score + mood_score + cost_performance_score + service_score + imagination_score
  #end

  #validate :title, uniqueness: true
  #def total_score
  #  (delicious_score.to_i + mood_score.to_i + cost_performance_score.to_i + service_score.to_i + imagination_score.to_i) / 5
  #end

  scope :with_total_score, ->{ select("reviews.*, delicious_score + mood_score + cost_performance_score + service_score + imagination_score as total_score") }


#  def to_param
  #  visited ? visited : id.to_s
  #end

#  def self.find_by_visited_or_id(arg)
#    find_by_visited(arg) || find(arg)
#  end

  def  self.review_import(review_file)
    save_cnt = 0
    CSV.foreach(review_file.path, headers: true) do |row|
      review = Review.find_by(id: row["id"]) || new
      eatery = Eatery.find_by(tel: row["tel"])
      review.attributes = row.to_hash.slice(*review_attributes)
      review.eatery_id = eatery&.id
      next if self.where(eatery_id: review.eatery.id).where(title: review.title).count > 0
      review.save!
      save_cnt += 1
    end
    save_cnt
  end

  def self.review_attributes
    [
    "delicious_score", #美味しさ
    "mood_score", #ムードスコア
    "cost_performance_score", #コストパフォーマンススコア
    "service_score", #サービススコア
    "imagination_score", #イマジネーションスコア
    "original1",
    "original1_score", #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
    "original22",
    "original2_score", #旅行、デート、お酒、素材、独創性、の質等、様々なブログジャンルを確立出来る
    "revisit", #再訪したいレベルか？
    "average_price", #平均金額
    "title", #タイトル
    "keyword", #キーワード
    "description", #説明
    "body",
    "visited"]
  end

  def last_review
    self.reviews.last
  end

  @@ScoreNumbers = [
50,
49,
48,
47,
46,
45,
44,
43,
42,
41,
40,
39,
38,
37,
36,
35,
34,
33,
32,
31,
30,
29,
28,
27,
26,
25,
24,
23,
22,
21,
20,
19,
18,
17,
16,
15,
14,
13,
12,
11,
10,
9,
8,
7,
6,
5,
4,
3,
2,
1,
  ]

  def self.ScoreNumbers
    @@ScoreNumbers
  end

  def self.create_reviews_by(review_params)
    return false if review_params[:image_2].nil?
    Review.transaction do
      review_params[:image_2].each do |review|
        new_review = Review.new(image_2: review)
        return false unless new_review.save!
      end
    end
    true
  end

  def total_score
    (delicious_score.to_i + mood_score.to_i  + cost_performance_score.to_i  + service_score.to_i  + imagination_score.to_i )
  end

  enum status: {draft: 0, published: 1}
  #has_one_attached :image
  #has_rich_text :body

  def address
    prefecture + city + town + chome + building
  end

  def get_genres
   #genre.split(',').map { |m| m.delete('[]"\\\\').strip }.reject(&:blank?)
  end

  def self.GenreLists
    @@GenreLists
  end

  @@GenreLists = [
    ["フレンチ","フレンチ"],
    ["イノベーティブ・フュージョン","イノベーティブ・フュージョン"],
    ["ビストロ","ビストロ"],
    ["イタリアン","イタリアン"],
    ["バル","バル"],
    ["ピザ","ピザ"],
    ["スペイン料理","スペイン料理"],
    ["日本料理・割烹料理","日本料理・割烹料理"],
    ["天ぷら","天ぷら"],
    ["焼き鳥","焼き鳥"],
    ["焼肉","焼肉"],
    ["ステーキ・しゃぶしゃぶ","ステーキ・しゃぶしゃぶ"],
    ["中華料理","中華料理"],
    ["餃子","餃子"],
    ["郷土料理","郷土料理"],
    ["洋食","洋食"],
    ["寿司","寿司"],
    ["鮨","鮨"],
    ["和菓子","和菓子"],
    ["茶屋","茶屋"],
    ["カフェ","カフェ"],
    ["スイーツ","スイーツ"],
    ["バー","バー"],
    ["アジア料理","アジア料理"],
    ["カレー","カレー"],
    ["とんかつ","とんかつ"],
    ["居酒屋","居酒屋"],
    ["海鮮料理","海鮮料理"],
    ["鰻料理","鰻料理"],
    ["ハンバーグ","ハンバーグ"],
    ["定食","定食"],
    ["パン","パン"],
    ["お好み焼き・粉物","お好み焼き・粉物"],
    ["その他","その他"],
  ]

  def self.SituationLists
    @@SituationLists
  end

  @@SituationLists = [
    ["デート","デート"],
    ["おしゃれ","おしゃれ"],
    ["一人で入りやすい","一人で入りやすい"],
    ["接待","接待"],
    ["フォーマル","フォーマル"],
    ["大人数","大人数"],
    ["カジュアル","カジュアル"],
    ["食べ歩き","食べ歩き"],
    ["老舗","老舗"],
    ["ランチ","ランチ"],
    ["レストラン","レストラン"],
    ["お土産","お土産"],
  ]

  enum genre_code: { 北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
                          茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
                          新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
                          岐阜県:20,静岡県:21,愛知県:22,三重県:23,
                          滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
                          鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
                          徳島県:35,香川県:36,愛媛県:37,高知県:38,
                          福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:4}



end
