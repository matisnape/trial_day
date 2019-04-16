class FundraisersController < ApplicationController
  before_action :set_fundraiser, only: [:show, :destroy]

  # GET /fundraisers
  # GET /fundraisers.json
  def index
    @fundraisers = Fundraiser.all.includes(:payments)
  end

  # GET /fundraisers/1
  # GET /fundraisers/1.json
  def show
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
