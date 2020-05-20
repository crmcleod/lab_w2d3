class Pub
    attr_reader :name
    attr_accessor :till, :drinks

    def initialize(name, till, drinks = [])
        @name = name
        @till = till
        @drinks = drinks
    end

    def buy_drink(drink, customer)
        if check_id(customer)
            if customer.wallet >= drink.price()
                customer.wallet -= drink.price()
                @till += drink.price()
            end
        end
    end

    def check_id(customer)
        if customer.age >= 18
            return true
        else 
            return false
        end
    end
end
