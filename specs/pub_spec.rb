require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")

class TestPub < Minitest::Test
    def setup
        @drink1 = Drink.new("Beer", 5.2)
        @drink2 = Drink.new("Wine", 16.75)
        @customer1 = Customer.new("Barney Gumble", 200, 45)
        @customer2 = Customer.new("Homer Simpson", 1, 30)
        @customer3 = Customer.new("Maggie Simpson", 20000, 2)
        @pub1 = Pub.new("Sheeps Heid", 3000, [@drink1, @drink2])
    end

    def test_pub_constructor
        assert_equal("Sheeps Heid", @pub1.name)
        assert_equal(3000, @pub1.till)
        assert_equal(2, @pub1.drinks.length)
    end

    def test_check_id__old_enough
        result = @pub1.check_id(@customer2)
        assert_equal(true, result)
    end

    def test_check_id__not_old_enough
        result = @pub1.check_id(@customer3)
        assert_equal(false, result)
    end

    def test_buy_drink
    # A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub's till
        @pub1.buy_drink(@drink1, @customer1)
        assert_equal(200 - 5.2, @customer1.wallet)
        assert_equal(3000 + 5.2, @pub1.till)
    end

    def test_buy_drink__no_money
        @pub1.buy_drink(@drink2, @customer2)
        assert_equal(1, @customer2.wallet)
        assert_equal(3000, @pub1.till)
    end

    def test_buy_drink__too_young
        @pub1.buy_drink(@drink2, @customer3)
        assert_equal(20000, @customer3.wallet)
        assert_equal(3000, @pub1.till)
    end
end
