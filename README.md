# Utrace

A framework runs on a variety of trace tools and provides unified interface.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'utrace'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install utrace

## Usage

Pick a trace tool:

```ruby
# none by default
Utrace.instance = Utrace::None.new
# opentelemetry
Utrace.instance = Utrace::Otel.new
```

Make instrumentation

```ruby
Utrace.new_span('slow-query') do
  Utrace.attrs({user_id: 123})
  Utrace.event('step-1-start')
  # ...
  Utrace.event('step-2-start')
  # ...
rescue => e
  Utrace.error(e)
end
```

