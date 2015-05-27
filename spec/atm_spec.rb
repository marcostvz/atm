require_relative '../atm'

RSpec.describe Atm, "#balance" do
  context "with no balance file" do
    it "gives out the starting balance" do
      atm = Atm.new("test.txt")
      balance = atm.get_balance
      expect(balance).to eq Atm::STARTING_BALANCE
      File.delete("test.txt")
    end
  end
end

RSpec.describe Atm, "#modify_balance" do
  context "with starting money I withdraw 50" do
    it "gives out the remaining balance" do
      atm = Atm.new("test.txt")
      atm.modify_balance(-50)
      balance = atm.get_balance
      expect(balance).to eq Atm::STARTING_BALANCE - 50
      File.delete("test.txt")
    end
  end

  context "with starting money I withdraw more than I have" do
    it "balance remains equal" do
      atm = Atm.new("test.txt")
      atm.modify_balance(-500)
      balance = atm.get_balance
      expect(balance).to eq Atm::STARTING_BALANCE
      File.delete("test.txt")
    end
  end
end