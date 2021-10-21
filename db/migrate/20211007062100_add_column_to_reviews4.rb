class AddColumnToReviews4 < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :store, :string #店舗名
    add_column :reviews, :store_kana, :string #テンポメイ
    add_column :reviews, :url, :string #URL
    add_column :reviews, :tel, :string #電話番号
    add_column :reviews, :prefecture, :string
    add_column :reviews, :city, :string
    add_column :reviews, :town, :string
    add_column :reviews, :chome, :string
    add_column :reviews, :building, :string
    add_column :reviews, :genre, :string #ジャンル
    add_column :reviews, :situation, :string
    add_column :reviews, :price_lunch, :string #ランチ単価
    add_column :reviews, :price_dinner, :string #ディナー単価
    add_column :reviews, :remarks, :string #備考
  end
end
