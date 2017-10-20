module Zinc
  class BaseOrder
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
  end
end
