class Customer
    attr_reader :name, :age
    attr_accessor :wallet, :drunkenness

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = 0
    end
end
