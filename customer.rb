class Customer
    attr_reader :name, :age
    attr_accessor :wallet

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
    end
end
