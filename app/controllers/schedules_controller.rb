class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedules = Schedule.new
    @friends = Friend.all
  end

  # GET /schedules/1/edit
  def edit
    @friends = Friend.all
  end

class Friend < ApplicationRecord
  def full_name
    "#{username} - #{fullname}"
  end
end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedules = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedules.save
        format.html { redirect_to @schedules, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedules.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedules.update(schedule_params)
        format.html { redirect_to @schedules, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedules }
      else
        format.html { render :edit }
        format.json { render json: @schedules.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedules.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedules = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:date, :username, :mark, :comment)
    end
end
