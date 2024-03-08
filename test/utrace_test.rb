require "test_helper"

class UtraceTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Utrace::VERSION
  end
end
