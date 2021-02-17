class ReleasesController < ApplicationController
  before_action :set_search
  before_action :set_release
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @releases = Release.order(created_at: "DESC").page(params[:page])
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.new(release_params)
    if @release.save
      redirect_to releases_path
    else
      render 'new'
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy
     redirect_to releases_path
  end

  def update
    @release = Release.find(params[:id])
    if @release.update(release_params)
      redirect_to releases_path
    else
      render 'edit'
    end
  end

  def set_search
    @q = Eatery.ransack(params[:q])
    @eateries = @q.result
    @eateries = @eateries.all.order(created_at: 'desc')
  end

  private
  def release_params
    params.require(:release).permit(
      :title, #タイトル
      :file,  #写真
      :description, #説明
      :body #本文
      )
  end
end
