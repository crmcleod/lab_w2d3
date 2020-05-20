require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")

class TestCustomer < Minitest::Test
    def setup
        @customer1 = Customer.new("Barney Gumble", 200)
    end

    def test_customer_constructor
        assert_equal("Barney Gumble", @customer1.name)
        assert_equal(200, @customer1.wallet)
    end

    def 
end
