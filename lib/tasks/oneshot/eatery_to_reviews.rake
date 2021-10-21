namespace :oneshot do
  namespace :eatery_to_reviews do
    desc "eateryをreviewsへ移行"
    task apply: :environment do
      puts "実行中"
      ActiveRecord::Base.transaction do
       Eatery.find_each do |eatery|
        eatery.reviews.each do |review|
          review.update!(
            store: eatery.store,
            store_kana: eatery.store_kana,
            url: eatery.url,
            tel: eatery.tel,
            prefecture: eatery.prefecture,
            city: eatery.city,
            town: eatery.town,
            chome: eatery.chome,
            building: eatery.building,
            genre: eatery.genre,
            situation: eatery.situation,
            price_lunch: eatery.price_lunch,
            price_dinner: eatery.price_dinner,
            remarks: eatery.remarks
          )
        end
        puts "eatery.store #{eatery.store}の更新が完了しました。"
       end
     rescue => e
       puts "cancel #{e.message}"
     end
    end
  end
end
