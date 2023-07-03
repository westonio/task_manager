require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Instance Methods' do
    describe '#laundry?' do
      it 'should return true if title includes laundry' do
        task = Task.create!(title: "laundry", description: "Fold and put away your clothes")
        
        expect(task.laundry?).to eq(true)
      end
      
      it "returns true when the description is laundry" do
        task = Task.create!(title: "Clean Clothes", description: "laundry")
        
        expect(task.laundry?).to eq(true)
      end
      
      it "returns false when neither the description nor title is laundry" do
        task = Task.create!(title: "Do Dishes", description: "wash and put away your dishes")
        
        expect(task.laundry?).to eq(false)
      end

      it "is case insensitive when checking if the title contains the word laundry" do
        task = Task.create!(title: "Fold LAUNdry", description: "Fold clothes and put away your clothes")

        expect(task.laundry?).to eq(true)
      end

      it "returns true when the title contains the word laundry" do
        task = Task.create!(title: "Fold laundry", description: "Fold  and put away your clothes")

        expect(task.laundry?).to eq(true)
      end

      it "returns true when the description contains the word laundry" do
        task = Task.create!(title: "Fold clothes", description: "Fold laundry and put away your clothes")

        expect(task.laundry?).to eq(true)
      end

      it "is case insensitive when checking if the description contains the word laundry" do
        task = Task.create!(title: "Fold clothes", description: "Fold LAUNdry and put away your clothes")

        expect(task.laundry?).to eq(true)
      end
    end
  end
end