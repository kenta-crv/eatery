class Review < ApplicationRecord
  belongs_to :eatery
  belongs_to :user, optional: true
  mount_uploader :image_1, FilesUploader
  mount_uploaders :image_2, ImagesUploader
  serialize :image_2, JSON

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
    (delicious_score.to_i + mood_score.to_i  + cost_performance_score.to_i  + service_score.to_i  + imagination_score.to_i )/5
  end

  enum status: {draft: 0, published: 1}
  #has_one_attached :image
  #has_rich_text :body

end
