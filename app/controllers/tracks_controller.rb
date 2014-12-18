class TracksController < ApplicationController
  load_and_authorize_resource
  def index
      @tracks = Track.all
    end

    def new
      @track = Track.new
    end

    def create
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

    def tracks_with_comments_needing_approval
      @tracks = Track.with_comments_waiting_approval
      render :index
    end

    def track_params
      params.require(:track).permit(:name, :genre_id, :details, :user_id, :track_file, :track_image)
    end

end