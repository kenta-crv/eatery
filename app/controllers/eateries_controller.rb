class EateriesController < ApplicationController
  before_action :set_eatery
  before_action :authenticate_admin!, except: [:index, :show]
    def index
      @q = Eatery.ransack(params[:q])
      @eateries = @q.result
      @eateries = @eateries.page(params[:page]).per(20).order(created_at: :desc)
      #@eateries = Eatery.all
      respond_to do |format|
       format.html
       format.csv{ send_data @eateries.generate_csv, filename: "eateries-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
      end
    end

    def show
      @eatery = Eatery.find(params[:id])
      #@review = @eatery.reviews.build(params[:review_id])
    end

    def new
      @eatery = Eatery.new
    end

    def create
      @eatery = Eatery.new(eatery_params)
      if @eatery.save
        redirect_to eateries_path
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

    def review_import
      cnt = Review.review_import(params[:review_file])
      redirect_to eateries_url, notice:"#{cnt}件登録されました。"
    end

    private
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
        :payment, #支払方法
        :genre, #ジャンル
        :payment, #支払方法
        :price_lunch, #ランチ単価
        :price_dinner, #ディナー単価
        :hour, #営業時間
        :holiday, #定休日
        :difficulty, #難易度
        :bookking, #予約方法
        :sit, #席数
        :open, #オープン
        :chef, #シェフ
        :career, #キャリア
        :remarks, #備考
        :takeout,
        :file,
        :image_1,
        :image_2,
        :image_3,
        :image_4,
        :image_5,
        :image_6,
        :image_7,
        :image_8,
        :image_9,
        :image_10
        )
    end
end
