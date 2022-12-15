class Groomer
    attr_reader :name, :customers

    def initialize(name)
        @name = name
        @customers = []
        @service_price = {
            "bath" => 30,
            "hair cut" => 60,
            "nail trip" => 25,
        }
        @groom_list = {}
        @groomed_pets = {} 
    end

    def add_customer(name)
        # @customers.push(name)
        @customers << name
    end

    def customers_with_outstanding_balance
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


    def groom(service, pet)
        @groom_list[pet] = service
        # This is how to add a key-value pair into a hash
    end

    def track_info(pet)
        {
       which_service: @groom_list[pet],
       customer: find_customer_by_pet(pet).name, 
       pet: pet.name,
       price_of_service: @service_price[@groom_list[pet]],
    }
    end

    def find_customer_by_pet(pet) 
        @customers.find do |customer|
            customer.pets.find do |cust_pet|
                cust_pet == pet
            end
        end
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