require "day4"

describe Day4, d4: true do

  describe ".calc_card_wins" do
    context "given ['Card 1: 2|2', 'Card 2: 2|3']" do
      solver = Day4.new([
        'Card 1: 2|2', 
        'Card 2: 2|3'
      ])
      it "returns 1 for card_id 1" do
        expect(solver.calc_card_wins(1)).to eq(1)
      end
      it "returns 0 for card_id 2" do
        expect(solver.calc_card_wins(2)).to eq(0)
      end
    end
    context "given ['Card 1: 2 3|2 3', 'Card 2: 2 3|2 3']" do
      solver = Day4.new([
        'Card 1: 2 3|2 3', 
        'Card 2: 2 3|2 3'
      ])
      it "returns 4 for card_id 1" do
        expect(solver.calc_card_wins(1)).to eq(4)
      end
      it "returns 2 for card_id 2" do
        expect(solver.calc_card_wins(2)).to eq(2)
      end
    end
  end

  context "given sample input" do
    solver = Day4.new([
      'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53',
      'Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19',
      'Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1',
      'Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83',
      'Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36',
      'Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'
    ])
    it "returns 0 for card_id 6" do
      expect(solver.calc_card_wins(6)).to eq(0)
    end
    it "returns 0 for card_id 5" do
      expect(solver.calc_card_wins(5)).to eq(0)
    end
    it "returns 0 for card_id 5" do
      expect(solver.calc_card_wins(5)).to eq(0)
    end
  end
  
  describe "Card" do
    describe ".initialize" do
      context "given 'Card 1: 2 | 3 '" do
        context "creates a card" do
          card = Day4::Card.new("Card 1: 2 | 3")
          it "with card id 1" do
              expect(card.card_id).to eq(1)
          end
          it "with winners 2" do
              expect(card.winners).to eq([2])
          end
          it "with number 3" do
              expect(card.numbers).to eq([3])
          end
        end
      end
    end

    describe ".winning_count" do
      context "given 'Card 1: 2 | 3 '" do
        it "returns 0" do
          expect(Day4::Card.new("Card 1: 2 | 3").winning_count).to eq(0)
        end
      end
      context "given 'Card 1: 2 | 2 3'" do
        it "returns 1" do
          expect(Day4::Card.new("Card 1: 2 | 2 3").winning_count).to eq(1)
        end
      end
      context "given 'Card 1: 2 3 | 2 3 4 5'" do
        it "returns 2" do
          expect(Day4::Card.new("Card 1: 2 3 | 2 3 4 5").winning_count).to eq(2)
        end
      end
    end

    describe ".score" do
      context "given 'Card 1: 2 | 3 '" do
        it "returns 0" do
          expect(Day4::Card.new("Card 1: 2 | 3").score).to eq(0)
        end
      end
      context "given 'Card 1: 2 | 2 3'" do
        it "returns 1" do
          expect(Day4::Card.new("Card 1: 2 | 2 3").score).to eq(1)
        end
      end
      context "given 'Card 1: 2 3 | 2 3 4 5'" do
        it "returns 2" do
          expect(Day4::Card.new("Card 1: 2 3 | 2 3 4 5").score).to eq(2)
        end
      end
      context "given 'Card 1: 2 3 4 5| 2 3 4 5'" do
        it "returns 8" do
          expect(Day4::Card.new("Card 1: 2 3 4 5| 2 3 4 5").score).to eq(8)
        end
      end
    end
  end
end