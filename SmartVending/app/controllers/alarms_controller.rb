class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]

  # GET /alarms
  def index
    @alarms = Alarm.all
  end

  # GET /alarms/1
  def show
  end

  # GET /alarms/new
  def new
    @alarm = Alarm.new
  end

  # GET /alarms/1/edit
  def edit
  end

  # POST /alarms
  def create
    @alarm = Alarm.new(alarm_params)

    if @alarm.save
      redirect_to @alarm, notice: 'Alarm was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /alarms/1
  def update
    if @alarm.update(alarm_params)
      redirect_to @alarm, notice: 'Alarm was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /alarms/1
  def destroy
    @alarm.destroy
    redirect_to alarms_url, notice: 'Alarm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alarm_params
      params.require(:alarm).permit(:extID, :status, :severity, :date, :object, :category, :type)
    end
end
