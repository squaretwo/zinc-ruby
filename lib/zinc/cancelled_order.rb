require 'zinc/base_order'

module Zinc
  class CancelledOrder < BaseOrder
    def self.get(id)
      o = CancelledOrder.new
      response = Zinc.request(:get, url + '/' + id, {})
      if response
        o.set_values(response)
      end
      o
    end

    def self.url
      Zinc.url_base + 'cancellations'
    end

    private
  end
end
