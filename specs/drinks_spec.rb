require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")
require_relative("../food")

class TestDrinks < Minitest::Test
    def setup
        @drink1 = Drink.new("Beer", 5.2, 5)
        @drink2 = Drink.new("Wine", 16.75, 13)
    end

    def test_drink_constructor
        assert_equal("Beer", @drink1.name)
        assert_equal(5.2, @drink1.price)
        assert_equal(13, @drink2.abv)
    end
end
