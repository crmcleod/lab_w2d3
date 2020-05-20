class Food
    attr_reader :price, :name, :rejuvenation_level

    def initialize(name, price, rejuvenation_level)
        @name = name
        @price = price
        @rejuvenation_level = rejuvenation_level
    end
end
