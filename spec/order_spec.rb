require 'spec_helper'

module Zinc
  describe Zinc do
    before do
      Zinc.api_key = 'foo'
    end

    describe "creating an order" do
      it "returns an Order" do
        Zinc::Order.create.should be_a(Zinc::Order)
      end
    end

    describe 'getting the API url' do
      it "returns the correct url" do
        Zinc::Order.url.should == 'https://api.zinc.io/v1/orders'
      end
    end

    describe "cancelling an order" do
      it "returns a CancelledOrder" do
        Zinc::Order.cancel("foo").should be_a(Zinc::CancelledOrder)
      end
    end

    describe "returning an order" do
      it "returns a ReturnedOrder" do
        Zinc::Order.return("foo").should be_a(Zinc::ReturnedOrder)
      end
    end
  end
end
