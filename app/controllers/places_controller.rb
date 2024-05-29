class PlacesController < ApplicationController

  def index
    @places = Place.all

    @users_table = User.all
    @current_user_id_row = User.find_by({"id"=>cookies["user_id"]})
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })

    @current_user_id_row = User.find_by({"id"=>cookies["user_id"]})
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
