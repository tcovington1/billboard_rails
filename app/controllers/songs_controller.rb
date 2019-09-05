class SongsController < ApplicationController
  before_action :set_billboard 

  def index
    @uss = @song.billboards.where(billboard_name: 'us')
    @bills = @song.billboards.where(billboard_name: 'billboard')
    @tops = @song.billboards.where(billboard_name: 'Top 100')
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    render partial: 'form'
  end

  def update
    # @topic = Topic.find(params[:id])
    if @song.update(song_params)
          redirect_to [@billboard, @song]
        else
          render :edit
        end
  end
    
  def new
    @users = Artist.all - @song.artists 
    @billboard = @song.billboards.new
  end

  def create
    @billboard = @song.billboards.new(billboard_params)

    if @billboard.save
      redirect_to song_billboards_path(@song)
    else
      render :new
    end
  end

  def destroy
    @billboard = @song.billboards.find(params[:id])
    @billboard.destroy
    redirect_to song_billboards_path(@song)
  end

  private 
    def billboard_params
      params.require(:billboard).permit(:billboard_name, :artist_id)
    end
    
    def song_params
      params.require(:song).permit(:title, :artist)
    end

    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end
end
