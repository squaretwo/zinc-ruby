require 'spec_helper'

describe Zinc do
  context "API Bindings" do
    before(:each) do
      @mock = mock
      Zinc.api_key = 'foo'
      Zinc.mock_rest_client = @mock
    end

    it "doesn't use the network when creating a new Order object" do
      @mock.should_receive(:get).never
      Zinc::Order.create
    end

    it "returns a response object when Zinc.request called" do
      data = {'foo' => "bar"}
      @mock.should_receive(:post).once.and_return(test_response(data))
      response = Zinc.request(:post, Zinc::Order.url, data)
      response.should == data
    end

    context "create object with params" do
      before(:each) do
        expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url, :payload => test_order_create.to_json}
        @mock.should_receive(:post).once.with(expects).and_return(test_response(test_order_response))
        @order = Zinc::Order.create(test_order_create)
      end

      it "sends a post request" do
      end

      it "returns an order object with accessible attributes" do
        @order.merchant.should == test_order_response[:merchant]
        @order.created_date.should == test_order_response[:created_date]
      end

      it "request sends API key as user" do
      end
    end

    context "get existing object" do
      it "returns an order object when get called with id" do
        id = test_order_response[:id]
        expects = {:url => Zinc::Order.url+'/'+id, :user => Zinc.api_key, :method => :get, :headers => {params: {}}}
        @mock.should_receive(:get).once.with(expects).and_return(test_response(test_order_response))
        @order = Zinc::Order.get(id)

        @order.id.should == id
        @order.merchant.should == test_order_response[:merchant]
      end

      it "returns a cancelled order when get called with id" do
        id = test_cancelled_order_response[:id]
        expects = {:url => Zinc::CancelledOrder.url+'/'+id, :user => Zinc.api_key, :method => :get, :headers => {params: {}}}
        @mock.should_receive(:get).once.with(expects).and_return(test_response(test_cancelled_order_response))
        @cancelled_order = Zinc::CancelledOrder.get(id)
        @cancelled_order.id.should == id
        @cancelled_order.should be_a(Zinc::CancelledOrder)
      end

      it "returns a returned order when get called with id" do
        id = test_returned_order_response[:id]
        expects = {:url => Zinc::ReturnedOrder.url+'/'+id, :user => Zinc.api_key, :method => :get, :headers => {params: {}}}
        @mock.should_receive(:get).once.with(expects).and_return(test_response(test_returned_order_response))
        @returned_order = Zinc::ReturnedOrder.get(id)
        @returned_order.id.should == id
        @returned_order.should be_a(Zinc::ReturnedOrder)
      end
    end

    it "should call zinc to cancel the order" do
      id = test_order_response[:id]
      create_expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url, :payload => test_order_create.to_json}
      @mock.should_receive(:post).once.with(create_expects).and_return(test_response(test_order_response))

      data = {id: id}
      cancel_expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url+'/'+id+'/cancel', :payload => data.to_json}
      @mock.should_receive(:post).once.with(cancel_expects).and_return(test_response({request_id: id}))

      order = Zinc::Order.create(test_order_create)
      o = Zinc::Order.cancel(id, data)
    end

    it "should call zinc to return the order" do
      id = test_order_response[:id]
      create_expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url, :payload => test_order_create.to_json}
      @mock.should_receive(:post).once.with(create_expects).and_return(test_response(test_order_response))

      data = {id: id}
      return_expects = {:user => Zinc.api_key, :method => :post, :url => Zinc::Order.url+'/'+id+'/return', :payload => data.to_json}
      @mock.should_receive(:post).once.with(return_expects).and_return(test_response({request_id: id}))

      order = Zinc::Order.create(test_order_create)
      o = Zinc::Order.return(id, data)
    end
  end
end
