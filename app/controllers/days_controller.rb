class DaysController < ApplicationController
  before_action :set_day, only: [:show]

  def index
    @days = Day.all

    render json: @days
  end

  def show
    render json: @day
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

end
