class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
    @event = Event.all
    @users = User.all
    @admin_id = @users
  end

  def show
    e = Event.all
    @event = Event.find(params[:id])
    u = User.all
    @user = User.find(params[:id])
    @date = @event.start_date
    @admin = @user.first_name
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created !"
      redirect_to root_path
    else
      flash.now[:danger] = 'Event could not be created - please check again.'
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.permit(:title, :start_date, :duration, :description, :price, :location, :admin_id)
    end



end
