class Groomer
    attr_reader :name, :customers

    def initialize(name)
        @name = name
        @customers = []
    end

    def add_customer(name)
        # @customers.push(name)
        @customers << name
    end

    def with_outst_bal
        @customers.find_all do |cust|
            cust.outstanding_balance > 0
        end
    end

    def amount_of_pets(pet_type)
        pets = []
        @customers.each do |customer|
            customer.pets.each do |pet|
                pets << pet if pet.type == pet_type
            end
        end
        pets.count
    end

        # BE CAREFUL WITH <.find_all> 
        # it returns a new array!

        # pets_of_one_type = []

        # @customers.each do |customer|
        #     customer_result = customer.pets.find_all do |pet|
        #         pet.type == pet_type
        #     end
        #     pets_of_one_type.concat(customer_result)     
        # end

        # pets_of_one_type.length
   
       



end