require 'spec_helper'


describe Zinc::ProductDetails do
  before do
    @mock = mock
    Zinc.api_key = 'foo'
    Zinc.mock_rest_client = @mock
  end

  describe 'getting product details' do
    it "returns a ProductDetails" do
      data = {
          retailer: 'amazon'
      }
      expects = {:user => Zinc.api_key, :method => :get, :url => Zinc::ProductDetails.url('B002Q633CI'), :headers => {params: data}}
      @mock.should_receive(:get).once.with(expects).and_return(test_response(test_product_details_response))
      Zinc::ProductDetails.get('B002Q633CI', {retailer: 'amazon'}).should be_a(Zinc::ProductDetails)
    end
  end


  describe 'getting the API product detail url' do
    it "returns the correct url" do
      Zinc::ProductDetails.url('B002Q633CI').should == 'https://api.zinc.io/v1/products/B002Q633CI'
    end
  end

end

