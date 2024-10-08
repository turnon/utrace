module Utrace
  class None
    def new_span(name, &block)
      block.call
    end

    def untraced(&block)
      block.call
    end

    def event(name, attrs: nil); end

    def error(err); end

    def attrs(attrs); end

    def trace_id; end
  end
end
