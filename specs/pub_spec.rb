require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")
require_relative("../food")

class TestPub < Minitest::Test
    def setup
        @drink1 = Drink.new("Beer", 5.2, 5)
        @drink2 = Drink.new("Wine", 16.75, 12)
        @food1 = Food.new("Burger", 11.10, 5)
        @food2 = Food.new("Pizza", 15.10, 15)
        @customer1 = Customer.new("Barney Gumble", 200, 45)
        @customer2 = Customer.new("Homer Simpson", 1, 30)
        @customer3 = Customer.new("Maggie Simpson", 20000, 2)
        @pub1 = Pub.new("Sheeps Heid", 3000, {@drink1 => 5, @drink2 => 3}, {@food1 => 3, @food2 => 1})
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
        assert_equal(5, @customer1.drunkenness)
    end

    def test_buy_drink__no_money
        @pub1.buy_drink(@drink2, @customer2)
        assert_equal(1, @customer2.wallet)
        assert_equal(3000, @pub1.till)
        assert_equal(0, @customer2.drunkenness)
    end

    def test_buy_drink__too_young
        @pub1.buy_drink(@drink2, @customer3)
        assert_equal(20000, @customer3.wallet)
        assert_equal(3000, @pub1.till)
        assert_equal(0, @customer3.drunkenness)
    end

    def test_buy_drink__too_drunk
        @pub1.buy_drink(@drink2, @customer1)
        @pub1.buy_drink(@drink2, @customer1)
        # check wallet value before and after to make sure he didnt get sold another drink
        wallet_before = @customer1.wallet
        @pub1.buy_drink(@drink2, @customer1)
        assert_equal(wallet_before, @customer1.wallet)
    end

    def test_buy_food
        @pub1.buy_drink(@drink2, @customer1)
        @pub1.buy_food(@food1, @customer1)
        assert_equal(7, @customer1.drunkenness)
    end
end
