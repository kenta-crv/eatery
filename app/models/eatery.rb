class Eatery < ApplicationRecord
  mount_uploader :image_1, ImagesUploader
  mount_uploader :image_2, ImagesUploader
  mount_uploader :image_3, ImagesUploader
  mount_uploader :image_4, ImagesUploader
  mount_uploader :image_5, ImagesUploader
  mount_uploader :image_6, ImagesUploader
  mount_uploader :image_7, ImagesUploader
  mount_uploader :image_8, ImagesUploader
  mount_uploader :image_9, ImagesUploader
  mount_uploader :image_10, ImagesUploader
  has_many :reviews, dependent: :destroy

  def to_param
    canonical_name ? canonical_name : id.to_s
  end

  def self.find_by_canonical_name_or_id(arg)
    find_by_canonical_name(arg) || find(arg)
  end
  #eatery_import
  def self.import(file)
      save_cont = 0
      CSV.foreach(file.path, headers:true) do |row|
       eatery = find_by(id: row["id"]) || new
       eatery.attributes = row.to_hash.slice(*updatable_attributes)
       #next if eatery.industry == nil
       next if self.where(tel: eatery.tel).count > 0
       #next if self.where(tel: eatery.tel).where(industry: eatery.industry).count > 0
       eatery.save!
       save_cont += 1
      end
      save_cont
  end
  def self.updatable_attributes
    [
    "store", #店舗名
    "store_kana",
    "url", #URL
    "tel", #電話番号
    "prefecture",
    "city",
    "town",
    "chome",
    "building",
    "payment", #支払方法
    "genre", #ジャンル
    "payment", #支払方法
    "price_lunch", #ランチ単価
    "price_dinner", #ディナー単価
    "hour", #営業時間
    "holiday", #定休日
    "difficulty", #難易度
    "bookking", #予約方法
    "sit", #席数
    "open", #オープン
    "chef", #シェフ
    "career", #キャリア
    "remarks", #備考
    "takeout",]
  end

  def address
    prefecture + city + town + chome + building
  end

  enum genre_code: { 北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
                          茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
                          新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
                          岐阜県:20,静岡県:21,愛知県:22,三重県:23,
                          滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
                          鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
                          徳島県:35,香川県:36,愛媛県:37,高知県:38,
                          福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:4}


end