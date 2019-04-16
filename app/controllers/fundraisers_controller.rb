class FundraisersController < ApplicationController
  before_action :set_fundraiser, only: [:show, :edit, :update, :destroy]

  # GET /fundraisers
  # GET /fundraisers.json
  def index
    @fundraisers = Fundraiser.all.includes(:payments)
  end

  # GET /fundraisers/1
  # GET /fundraisers/1.json
  def show
  end

  # GET /fundraisers/new
  def new
    @fundraiser = Fundraiser.new
  end

  # GET /fundraisers/1/edit
  def edit
  end

  # POST /fundraisers
  # POST /fundraisers.json
  def create
    @fundraiser = Fundraiser.new(fundraiser_params)

    respond_to do |format|
      if @fundraiser.save
        format.html { redirect_to @fundraiser, notice: 'Fundraiser was successfully created.' }
        format.json { render :show, status: :created, location: @fundraiser }
      else
        format.html { render :new }
        format.json { render json: @fundraiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fundraisers/1
  # PATCH/PUT /fundraisers/1.json
  def update
    respond_to do |format|
      if @fundraiser.update(fundraiser_params)
        format.html { redirect_to @fundraiser, notice: 'Fundraiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @fundraiser }
      else
        format.html { render :edit }
        format.json { render json: @fundraiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fundraisers/1
  # DELETE /fundraisers/1.json
  def destroy
    @fundraiser.destroy
    respond_to do |format|
      format.html { redirect_to fundraisers_url, notice: 'Fundraiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fundraiser
      @fundraiser = Fundraiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fundraiser_params
      params.require(:fundraiser).permit(:title, :description, :funds_aim, :funds_current, :funds_percentage, :payments_total_count)
    end
end
