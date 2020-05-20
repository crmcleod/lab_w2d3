class Pub
    attr_reader :name
    attr_accessor :till, :drinks

    def initialize(name, till, drinks)
        @name = name
        @till = till
        @drinks = drinks
    end
end
