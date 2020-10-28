require 'pry'

class Customer
  
    @@all = []

    def initialize( name, age )
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal( waiter, total, tip=0 )
        Meal.new( waiter, self, total, tip )
    end

    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end

    def meals
        arr = []
        Meal.all.each do |meal|
            if meal.customer == self
                arr << meal
            end
        end
        arr
    end
end