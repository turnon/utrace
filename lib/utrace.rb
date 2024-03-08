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

    def log_event(name, attrs: nil)
      instance.log_event(name, attrs: attrs)
    end

    def log_error(err)
      instance.log_error(err)
    end

    def add_attrs(attrs)
      instance.add_attrs(attrs)
    end

    def trace_id
      instance.trace_id
    end
  end
end
