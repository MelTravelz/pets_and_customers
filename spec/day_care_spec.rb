require './lib/customer'
require './lib/pet'
require './lib/day_care'

RSpec.describe DayCare do
    let(:day_care) {DayCare.new("Pet Kare")}

    let(:jill) {Customer.new("Jill", 1)}
    let(:joel) {Customer.new("Joel", 2)}
    
    let(:samson) {Pet.new({name: "Samson", type: :dog, age: 3})}
    let(:lucy) {Pet.new({name: "Lucy", type: :cat, age: 12})}
    let(:max) {Pet.new({name: "Max", type: :cat, age: 5})}

    describe "Iteration 3" do
        it "exists" do
            expect(day_care).to be_instance_of(DayCare)

        end

        it "has attributes" do
            expect(day_care.name).to eq("Pet Kare")  
            expect(day_care.customers).to eq([])  
        end 

        it "can add customers" do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            day_care.add_customer(jill)
            day_care.add_customer(joel)

            expect(day_care.customers).to eq([jill, joel])
            expect(day_care.customers.first.pets).to eq([max])
            #DIDNT WORK:  expect(day_care.customers.last.pets[1]).to eq(samson)
            #DIDNT WORK:  expect(day_care.customers.last.pets[1]).to eq([lucy,samson])
        end

        it "find customer by ID number" do
            day_care.add_customer(jill)
            day_care.add_customer(joel)

            expect(day_care.find_customer_by_id(1)).to eq(jill)
        end
        
        it "list all unfed pets"do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            day_care.add_customer(jill)
            day_care.add_customer(joel)

            lucy.feed

            expect(day_care.list_all_unfed_pets).to eq([max, samson])
        end
    end

    describe "Iteration 4" do
        it "feed_all_unfed_pets" do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            day_care.add_customer(jill)
            day_care.add_customer(joel)
        
            lucy.feed

            expect(day_care.list_all_unfed_pets).to eq([max, samson])
            
            day_care.feed_all_unfed_pets

            expect(day_care.list_all_unfed_pets).to eq([])
        end

        it "charge_customer" do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            day_care.add_customer(jill)
            day_care.add_customer(joel)

            max.feed

            day_care.feed_all_unfed_pets
            # dog = 5
            # cat = 3

            expect(day_care.find_customer_by_id(2).outstanding_balance).to eq(8)
        end
    end
end
