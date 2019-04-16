require 'rails_helper'

RSpec.describe FundraisersController, type: :controller do
  fixtures :fundraisers, :payments
  render_views

  it "GET #index renders index template" do
    get :index
    expect(response).to render_template :index
    expect(response.status).to eq 200
  end

  it "GET #show renders show template" do
    get :show, params: { id: Fundraiser.first.id }
    expect(response).to render_template :show
    expect(response.status).to eq 200
  end
end
