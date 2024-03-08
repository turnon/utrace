module Utrace
  class Otel
    def initialize(name: self.class.name)
      @tracer = OpenTelemetry.tracer_provider.tracer(name)
    end

    def new_span(name, &block)
      @tracer.in_span(name.to_s) { |_span| block.call }
    end

    def log_event(name, attrs: nil)
      ::OpenTelemetry::Trace.current_span.add_event(name, attributes: validate_attrs(attrs))
    end

    def log_error(err)
      ::OpenTelemetry::Trace.current_span.record_exception(err)
    end

    def add_attrs(attrs)
      attrs = validate_attrs(attrs)
      ::OpenTelemetry::Trace.current_span.add_attributes(attrs)
    end

    def trace_id
      ::OpenTelemetry::Trace.current_span.context.trace_id.unpack1('H*')
    end

    private

    def validate_attrs(attrs)
      return nil unless attrs

      new_attrs = {}
      attrs.each_pair do |key, value|
        new_attrs[key.to_s] = value if ::OpenTelemetry::SDK::Internal.valid_value?(value)
      end
      new_attrs
    end
  end
end
