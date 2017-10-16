require 'spec_helper'


describe Zinc::ProductPrices do
  before do
    @mock = mock
    Zinc.api_key = 'foo'
    Zinc.mock_rest_client = @mock
  end

  describe 'getting product prices' do
    it "returns a ProductPrices" do
      data = {
          retailer: 'amazon'
      }
      expects = {:user => Zinc.api_key, :method => :get, :url => Zinc::ProductPrices.url('B002Q633CI'), :headers => {params: data} }
      @mock.should_receive(:get).once.with(expects).and_return(test_response(test_product_prices_response))
      Zinc::ProductPrices.get('B002Q633CI', {retailer: 'amazon'}).should be_a(Zinc::ProductPrices)
    end
  end


  describe 'getting the API product prices url' do
    it "returns the correct url" do
      Zinc::ProductPrices.url('B002Q633CI').should == 'https://api.zinc.io/v1/products/B002Q633CI/offers'
    end
  end

end

