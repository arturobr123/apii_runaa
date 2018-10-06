class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :update, :destroy]

  before_action :authenticate_user,  only: [:create,:update]
  before_action :authorize_as_admin, only: [:index, :destroy]
  before_action :authorize,          only: [:update]

  # GET /registers
  def index
    @registers = Register.all

    render json: @registers
  end

  # GET /registers/1
  def show
    render json: @register
  end

  # POST /registers
  def create
    @register = Register.new(register_params)

    if @register.save
      render json: @register, status: :created, location: @register
    else
      render json: @register.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registers/1
  def update
    if @register.update(register_params)
      render json: @register
    else
      render json: @register.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registers/1
  def destroy
    @register.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def register_params
      params.require(:register).permit(:user_id, :day_id, :entry, :exit)
    end

    def authorize
      return true if current_user.is_admin?
      return_unauthorized unless @register.user_id == current_user.id
    end
end
