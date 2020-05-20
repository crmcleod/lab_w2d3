require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")

class TestCustomer < Minitest::Test
    def setup
        @customer1 = Customer.new("Barney Gumble", 200, 45)
        @customer2 = Customer.new("Homer Simpson", 1, 30)
        @cusomter3 = Customer.new("Maggie Simpson", 20000, 2)
        @drink1 = Drink.new("Beer", 5.2)
        @drink2 = Drink.new("Wine", 16.75)
        @pub1 = Pub.new("Sheeps Heid", 3000, [@drink1, @drink2])
    end

    def test_customer_constructor
        assert_equal("Barney Gumble", @customer1.name)
        assert_equal(200, @customer1.wallet)
    end

    def test_buy_drink
    # A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub's till
        @customer1.buy_drink(@drink1, @pub1)
        assert_equal(200 - 5.2, @customer1.wallet)
        assert_equal(3000 + 5.2, @pub1.till)
    end

    def test_buy_drink__no_money
        @customer2.buy_drink(@drink2, @pub1)
        assert_equal(1, @customer2.wallet)
        assert_equal(3000, @pub1.till)
    end

end
