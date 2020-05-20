require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drinks")
require_relative("../pub")

class TestPub < Minitest::Test
    def setup
        @pub1 = Pub.new("Sheeps Heid", 3000, [])
    end

    def test_pub_constructor
        assert_equal("Sheeps Heid", @pub1.name)
        assert_equal(3000, @pub1.till)
        assert_equal([], @pub1.drinks)
    end
end
