class TracksController < ApplicationController

  def index
      @tracks = Track.all
    end

    def new
      @track = Track.new
    end

    def create
      # @track = Track.new(track_params)
      @track = current_user.tracks.new(track_params)
      @track.save
      redirect_to(@track)
    end

    def show
      @track = Track.find(params[:id])
    end

    def edit
      @track = Track.find(params[:id])
    end

    def update
      @track = Track.find(params[:id])
      @track.update(track_params)
      redirect_to(@track)
    end

    def destroy
      @track = Track.find(params[:id])
      @track.destroy
      redirect_to(tracks_path)
    end

    def track_params
      params.require(:track).permit(:name, :genre_id, :details, :user_id)
    end

end