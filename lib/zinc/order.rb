require 'zinc/base_order'

module Zinc
  class Order < BaseOrder

    def self.create(params = {})
      o = Order.new
      response = Zinc.request(:post, url, params)
      if response
        o.set_values(response)
      end
      o
    end

    def self.get(id)
      o = Order.new
      response = Zinc.request(:get, url+'/' + id, {})
      if response
        o.set_values(response)
      end
      o
    end

    def self.cancel(id, params = {})
      o = CancelledOrder.new
      response = Zinc.request(:post, url+'/' + id + '/cancel', params)
      if response
        o.set_values(response)
      end
      o
    end

    def self.return(id, params = {})
      o = ReturnedOrder.new
      response = Zinc.request(:post, url + '/' + id + '/return', params)
      if response
        o.set_values(response)
      end
      o
    end

    def self.url
      Zinc.url_base + 'orders'
    end

    private
  end
end

