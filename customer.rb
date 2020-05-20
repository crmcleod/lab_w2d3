class Customer
    attr_reader :name, :wallet, :age

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
    end

    def buy_drink(drink, pub)
        if @wallet >= drink.price()
            @wallet -= drink.price()
            pub.till += drink.price()
        end
    end
end
