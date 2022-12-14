class DayCare
    attr_reader :name, :customers, :dog_price, :cat_price

    def initialize(name)
        @name = name
        @customers = []
        @dog_price = 5
        @cat_price = 3
    end

    def add_customer(customer)
        @customers << customer
        # @customers.push(customer)
    end

    def find_customer_by_id(id)
        @customers.find do |customer|
            customer.id == id
        end
        # if .map OR .each will need an if statement
    end

    def list_all_unfed_pets
        @customers.map do |customer|
            customer.pets.reject do |pet|
                pet.fed?
            end
        end.flatten
    end
        #OPTION 2
    #   @customer.map do |customer|
    #     customer.pets.select do |pet|
    #         !pet.fed?
    #         end
    #     end.flatten
    

        # OPTION 3
        # unfed_pets = []
        # @customers.each do |customer|
        #     customer.pets.each do |pet|
        #         unfed_pets << pet unless pet.fed?
        #     end
        # end
        # unfed_pets
    

    def feed_all_unfed_pets
        # NOT using map because we don't care about the return (an empty array)
        list_all_unfed_pets.each do |pet|

            # Added this as helper method: 
                # customer = @customers.find do |customer|
                #     customer.pet.find do |cust_pet|
                #         cust_pet == pet
                #     end
                # end
                # customer.charge(5)

            customer = find_customer_by_pet(pet)

                if pet.type == :dog
                    customer.charge(@dog_price)
                elsif pet.type == :cat
                    customer.charge(@cat_price)
                end

            pet.feed
        end
    end

    def find_customer_by_pet(pet) 
        @customers.find do |customer|
            customer.pets.find do |cust_pet|
                cust_pet == pet
            end
        end
    end
    
end