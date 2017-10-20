require 'zinc/base_order'

module Zinc
  class ReturnedOrder < BaseOrder

    def self.get(id, params={})
      o = ReturnedOrder.new
      response = Zinc.request(:get, url + '/' + id, params)
      if response
        o.set_values(response)
      end
      o
    end

    def self.url
      Zinc.url_base + 'returns'
    end

    private
  end
end
