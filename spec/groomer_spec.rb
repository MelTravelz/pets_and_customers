require './lib/customer'
require './lib/pet'
require './lib/groomer'

RSpec.describe Groomer do
    let(:groomer) {Groomer.new("fur-less")}

    let(:jill) {Customer.new("Jill", 1)}
    let(:joel) {Customer.new("Joel", 2)}
    
    let(:samson) {Pet.new({name: "Samson", type: :dog, age: 3})}
    let(:lucy) {Pet.new({name: "Lucy", type: :cat, age: 12})}
    let(:max) {Pet.new({name: "Max", type: :cat, age: 5})}

    describe "Iteration 3" do

        it "exists" do
            expect(groomer).to be_instance_of(Groomer)
        end

        it "has attributes" do
            expect(groomer.name).to eq("fur-less")
        end

        it "can add customers" do
            expect(groomer.customers).to eq([])

            groomer.add_customer(jill)
            groomer.add_customer(joel)

            expect(groomer.customers).to eq([jill, joel])
        end

        it "can add customers" do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            groomer.add_customer(jill)
            groomer.add_customer(joel)

            expect(groomer.customers.last.pets).to eq([lucy, samson])
        end

        it "can find customers with outstanding $" do
            joel.adopt(lucy)
            joel.adopt(samson)

            groomer.add_customer(joel)

            joel.charge(120)

            expect(groomer.with_outst_bal).to eq([joel])
        end

        it "can count # of pets of a given type" do
            jill.adopt(max)
            joel.adopt(lucy)
            joel.adopt(samson)
            
            groomer.add_customer(jill)
            groomer.add_customer(joel)

            expect(groomer.amount_of_pets(:cat)).to eq(2)
            expect(groomer.amount_of_pets(:dog)).to eq(1)
        end

    end



    # describe "Iteration 4" do
    # end

end


