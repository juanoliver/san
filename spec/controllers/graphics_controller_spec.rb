require 'rails_helper'

RSpec.describe GraphicsController, :type => :controller do

  describe "GET 'esolar'" do
    it "returns http success" do
      get 'esolar'
      expect(response).to be_success
    end
  end

  describe "GET 'psimulado'" do
    it "returns http success" do
      get 'psimulado'
      expect(response).to be_success
    end
  end

  describe "GET 'hechos'" do
    it "returns http success" do
      get 'hechos'
      expect(response).to be_success
    end
  end

  describe "GET 'eventos'" do
    it "returns http success" do
      get 'eventos'
      expect(response).to be_success
    end
  end

end
