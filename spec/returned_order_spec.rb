require 'spec_helper'

module Zinc
  describe Zinc do
    before do
      Zinc.api_key = 'foo'
    end

    describe 'getting the API url' do
      it "returns the correct url" do
        Zinc::ReturnedOrder.url.should == 'https://api.zinc.io/v1/returns'
      end
    end
  end
end
