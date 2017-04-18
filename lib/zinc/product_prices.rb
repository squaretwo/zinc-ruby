module Zinc
  class ProductPrices
    def self.get(product_id, params = {})
      p = ProductPrices.new
      response = Zinc.request(:get, url(product_id), params)
      if response
        p.set_values(response)
      end
      p
    end

    def self.url(product_id)
      Zinc.url_base+'products/:product_id/offers'.gsub(/:product_id/, product_id)
    end

    def set_values(values)
      @values = values
    end

    def method_missing(name, *args)
      @values ||= {}
      if name.to_s.end_with?('=')
        @values[name.to_s] = args[0]
      else
        @values[name.to_s]
      end
    end

    private
  end
end
