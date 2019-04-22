class FundraisersController < ApplicationController
  before_action :set_fundraiser, only: [:show, :destroy]

  def index
    @fundraisers = Fundraiser.all
  end

  def show
  end

  def destroy
    @fundraiser.destroy
    redirect_to fundraisers_url, notice: 'Fundraiser was successfully destroyed.'
  end

  private
    def set_fundraiser
      @fundraiser = Fundraiser.find(params[:id])
      @payments = @fundraiser.payments.paginate(per_page: 25, page: params[:page])
    end
end
