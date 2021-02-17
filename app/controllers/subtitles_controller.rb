class SubtitlesController < ApplicationController
  before_action :set_search
  before_action :set_release
  before_action :set_subtitle, only: [:edit, :update, :destroy, :new]
  before_action :set_user
  def index
    @subtitles = Subtitle.published.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @release = Release.find(params[:release_id])
    @subtitle = Subtitle.find_by(id: params[:id], release_id: @release.id)
  end

  def new
    @subtitle = @current_release.subtitles.build
  end

  def create
    @subtitle = @current_release.subtitles.build(subtitle_params)
    if @subtitle.save
      redirect_to releases_path
    else
      "new"
    end
  end

  def edit
    @subtitle = Subtitle.find(params[:id])
  end

  def destroy
    @subtitle = Subtitle.find(params[:id])
    @subtitle.destroy
     redirect_to subtitles_path
  end

  def update
    @subtitle = Subtitle.find(params[:id])
    if @subtitle.update(subtitle_params)
      redirect_to subtitles_path
    else
      render 'edit'
    end
  end

  def set_search
    @q = Review.ransack(params[:q])
    @q = Eatery.ransack(params[:q])
    @eateries = @q.result
    @eateries = @eateries.all.order(created_at: 'desc')
  end


private
 def set_subtitle
   @subtitle = @current_release.subtitles.find_by(id: params[:id])
 end

 def subtitle_params
  params.require(:subtitle).permit(
    :title, #タイトル
    :file,  #写真
    :description, #説明
    :body #本文
    )
  end
end
