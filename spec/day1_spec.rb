require "day1"

describe Day1, d1: true do
  describe ".first_digit" do
    context "given '1'" do
      it "returns 1" do
        expect(Day1.first_digit("1")).to eq(1)
      end
    end
    context "given '12'" do
      it "returns 1" do
        expect(Day1.first_digit("12")).to eq(1)
      end
    end
    context "given 'a12'" do
      it "returns 1" do
        expect(Day1.first_digit("a12")).to eq(1)
      end
    end
  end

  describe ".last_digit" do
    context "given '1'" do
      it "returns 1" do
        expect(Day1.last_digit("1")).to eq(1)
      end
    end
    context "given '12'" do
      it "returns 2" do
        expect(Day1.last_digit("12")).to eq(2)
      end
    end
    context "given 'a12a'" do
      it "returns 2" do
        expect(Day1.last_digit("a12a")).to eq(2)
      end
    end
  end

  describe ".line_value" do
    context "given '1'" do
      it "returns 11" do
        expect(Day1.line_value("1")).to eq(11)
      end
    end
    context "given '12'" do
      it "returns 12" do
        expect(Day1.line_value("12")).to eq(12)
      end
    end
    context "given 'a12a'" do
      it "returns 12" do
        expect(Day1.line_value("a12a")).to eq(12)
      end
    end
  end
end
