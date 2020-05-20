class Pub
    attr_reader :name
    attr_accessor :till, :drinks

    def initialize(name, till, drinks = [])
        @name = name
        @till = till
        @drinks = drinks
    end

    def check_id(customer)
        if customer.age >= 18
            return true
        else 
            return false
        end
    end
end
