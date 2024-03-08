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

Make instrumentatio:n

```
Utrace.new_span('slow-query') do
  Utrace.add_attrs({user_id: 123})
  Utrace.log_event('step-1-start')
  # ...
  Utrace.log_event('step-2-start')
  # ...
rescue => e
  Utrace.log_error(e)
end
```
