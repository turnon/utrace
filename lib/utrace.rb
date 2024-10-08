require "utrace/version"

require "utrace/none"
require "utrace/otel"

module Utrace
  class << self
    attr_writer :instance

    def instance
      @instance ||= None.new
    end

    def new_span(name, &block)
      instance.new_span(name, &block)
    end

    def untraced(&block)
      instance.untraced(&block)
    end

    def event(name, attrs: nil)
      instance.event(name, attrs: attrs)
    end

    def error(err)
      instance.error(err)
    end

    def attrs(attrs)
      instance.attrs(attrs)
    end

    def trace_id
      instance.trace_id
    end
  end
end
