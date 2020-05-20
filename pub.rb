class Pub
    attr_reader :name
    attr_accessor :till, :drinks, :food

    def initialize(name, till, drinks = {}, food = {})
        @name = name
        @till = till
        @drinks = drinks
        @food = food
    end

    def check_id(customer)
        if customer.age >= 18
            return true
        else 
            return false
        end
    end

    def can_sell_drink(drink, customer)
        return check_id(customer) &&
                customer.wallet >= drink.price() &&
                customer.drunkenness <= 20 &&
                @drinks[drink] != nil &&
                @drinks[drink] != 0
    end

    def buy_drink(drink, customer)
        if can_sell_drink(drink, customer)
            customer.wallet -= drink.price()
            @till += drink.price()
            customer.drunkenness += drink.alcohol_level()
            @drinks[drink] -= 1
        end
    end
   
    def buy_food(food, customer)
        if customer.wallet >= food.price()
            customer.wallet -= food.price()
            @till += food.price()
            customer.drunkenness -= food.rejuvenation_level()
        end
    end

    def stock_value
        total = 0
        for drink, number in @drinks
            total += drink.price * number
        end
        return total
    end
end
