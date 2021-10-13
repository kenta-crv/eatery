class AddColumnToReviews4 < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :store, :integer #店舗名
    add_column :reviews, :store_kana, :integer #テンポメイ
    add_column :reviews, :url, :integer #URL
    add_column :reviews, :tel, :integer #電話番号
    add_column :reviews, :prefecture, :integer
    add_column :reviews, :city, :integer
    add_column :reviews, :town, :integer
    add_column :reviews, :chome, :integer
    add_column :reviews, :building, :integer
    add_column :reviews, :genre, :integer #ジャンル
    add_column :reviews, :situation, :string
    add_column :reviews, :price_lunch, :integer #ランチ単価
    add_column :reviews, :price_dinner, :integer #ディナー単価
    add_column :reviews, :remarks, :integer #備考
  end
end
