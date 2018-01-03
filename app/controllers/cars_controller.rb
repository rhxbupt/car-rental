class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @current_user
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @user = User.find(session[:user_id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout1
     params.permit!
     @user = User.find(params['users_id'])
     car_params=params['cars']
     @car = Car.where(car_params).first
     if @car.status == 'available'
       @rental_history = History.create(:car_id => @car.id, :user_id => @car.user_id,
                                        :location => @car.location, :model => @car.model,
                                        :manufacturer => @car.manufacturer,
                                        :style => @car.style, :rental_rate=>@car.rental_rate,:license_number=>@car.license_number, :start => DateTime.now)
     end
     @car.status = 'checkout'
     @car.user_id = @user.id
    if(@car.save)
      @user.noc = 1
      @user.save
      flash[:success] = "Sucessful Check out a Car!"
    else
      flash[:error] = "The Check out operation is failed!"
    end
  end

  def checkout
    @car = Car.find(params['cars_id'])
    @car.user_id = params['user_id']
    @user = User.find(params['user_id'])

    if @car.status == 'available'
      @rental_history = History.create(:car_id => @car.id, :user_id => @car.user_id,
                                       :location => @car.location, :model => @car.model,
                                       :manufacturer => @car.manufacturer,
                                       :style => @car.style, :rental_rate=>@car.rental_rate,:license_number=>@car.license_number, :start => DateTime.now)
    end
    @car.status = 'checkout'

    if @car.save
      @user.noc = 1
      @user.save
      flash[:success] = "Sucessful Check out a Car!"

    else
      flash[:error] = "The Check out operation is failed!"
      redirect_to cars_url
    end


  end
  def help_reserve
    @user = User.find(params['user_id'])
    @car = Car.where(:status=>"available")
  end

  def reserve1
    params.permit!
    @user = User.find(params['users_id'])
    car_params=params['cars']
    @car = Car.where(car_params).first
    @car.status = 'reserved'
    @car.user_id = @user.id
    @rental_history = History.create(:car_id => @car.id, :user_id => @car.user_id,
                                     :location => @car.location, :model => @car.model,
                                     :manufacturer => @car.manufacturer,
                                     :style => @car.style, :rental_rate =>@car.rental_rate,:license_number=>@car.license_number, :start => DateTime.now)
    if(@car.save)
      @user.noc = 1
      @user.save
      redirect_to new_history_path

    else
      flash[:error] = "The Reserve operation is failed!"
    end
  end
  def reserve
    @car = Car.find(params['cars_id'])
    @car.user_id = params['user_id']
    @user = User.find(params['user_id'])
    @rental_history = History.create(:car_id => @car.id, :user_id => @car.user_id,
                                     :location => @car.location, :model => @car.model,
                                     :manufacturer => @car.manufacturer,
                                     :style => @car.style,:rental_rate=>@car.rental_rate,:license_number=>@car.license_number, :start => DateTime.now)
    @car.status= 'reserved'

    if @car.save
      @user.noc = 1
      @user.save
      redirect_to new_history_path

    else
      flash[:error] = "The Check out operation is failed!"
      redirect_to cars_url
    end


  end

  def help_return
    @user = User.find(params['user_id'])
    @car = Car.find_by_user_id(@user.id)
    @car.status = 'available'
    @car.user_id = '1'
    if @car.save
      @user.noc = 0
      @user.save
      flash[:success] = "Returned successfully!"
    else
      flash[:error] = "Returning operation is failed!"

    end
  end

  def return
    @car = Car.find(params['cars_id'])
    @user = User.find(params['user_id'])
    @car.status = 'available'
    @car.user_id = '1'
    @history = History.order("created_at").last
    @history.update(:end =>DateTime.now)

    if @car.save
      @user.noc = 0
      @user.save
      flash[:success] = "Returned successfully!"
    else flash[:error] = "Returning operation is failed!"

    end
  end



  def help_rent
  @user = User.find(params['user_id'])
  @car = Car.where(:status=>"available")
  end
  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def result
    params.permit!
    car_params=params[:session]
    param = car_params.delete_if{|key,value| value ==''}

    @cars = Car.where(param)
  end

  def viewhistory
    car_id = params[:car_id]
    @history = History.where(car_id: car_id)

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:location, :model, :manufacturer, :style, :status, :user_id,:license_number,:rental_rate)
    end
end
