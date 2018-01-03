class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index


    @history = History.where(params['history'])

  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    @history = History.where(user_id: session[:user_id])
  end

  def new
    @history = History.new

  end

  def create
    event = params[:history]
    start_date = DateTime.new event["start(1i)"].to_i, event["start(2i)"].to_i,
                              event["start(3i)"].to_i, event["start(4i)"].to_i, event["start(5i)"].to_i
    end_date = DateTime.new event["end(1i)"].to_i, event["end(2i)"].to_i,
                            event["end(3i)"].to_i, event["end(4i)"].to_i, event["end(5i)"].to_i
    @history = History.order("created_at").last
    if (start_date >= end_date) || (start_date >= DateTime.now + 7.days) ||(end_date > start_date + 10.hours) ||
        (end_date< start_date + 1.hour)
      redirect_to new_history_path
      flash[:error] = "please select a valid date!"
    else
      @history.update(:start => start_date, :end => end_date)
      redirect_to cars_url
      flash[:success] = "Reservation successful!"
    end
  end

  def edit

  end



  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html {redirect_to histories_path}
        format.json {render :show, status: :ok, location: @history}
      else
        format.html {render :edit}
        format.json {render json: @history.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @history.destory
    respond_to do |format|
      format.html {redirect_to histories_path}
      format.json {head :no_content}
    end
  end
  def set_history
    @history = History.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def history_params
    params.require(:history).permit(:start,:location, :model, :manufacturer, :style, :status, :user_id,:car_id,:license_number,:rental_rate,:end)
  end


end
