class HomeController < ApplicationController
  def index
      @tracks = Track.all
    end
end