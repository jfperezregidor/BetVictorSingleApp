# spec/controllers/api/vi/sports_controller_spec.rb
require 'rails_helper'
RSpec.describe Api::V1::SportsController do
  describe "GET #index" do

    it "returns correct JSON" do
        #response.should be_success 
        expect(get('api/v1/sports')["status"]).to eq(200)
        #~ body = JSON.parse(response.body)
        #~ body.should include('sports')
    end
  end
  

  
end
