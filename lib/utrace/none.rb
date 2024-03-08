module Utrace
  class None
    def new_span(name, &block); end

    def log_event(name, attrs: nil); end

    def log_error(err); end

    def add_attrs(attrs); end

    def trace_id; end
  end
end
