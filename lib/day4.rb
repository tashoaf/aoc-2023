class Day4

  def initialize(lines = nil)
    @card_wins = {}
    @cards = {}
    if lines == nil
      lines = File.readlines('inputs/day4.txt')
    end
    lines.each do |line|
        card = Card.new(line)
      @cards[card.card_id] = card
    end
  end

  def solve1()
    total = 0
    @cards.each do |card_id, card|
      total += card.score
    end
    total
  end

  def calc_card_wins(card_id)
    card_winning_count = @cards[card_id].winning_count
    if card_winning_count == 0
      return 0
    end
    ((card_id+1)..(card_id+card_winning_count)).each do |next_card_id|
      card_winning_count += get_card_wins(next_card_id)
    end
    card_winning_count
  end

  def get_card_wins(card_id)
    if !@cards.key? card_id
      0
    elsif @card_wins.key? card_id
      @card_wins[card_id]
    else
      @card_wins[card_id] = calc_card_wins card_id
      @card_wins[card_id]
    end
  end

  def solve2()
    total = 0
    @cards.each do |card_id, card|
      total += get_card_wins card_id
    end
    total + @cards.length
  end
  
  class Card
    attr_reader :card_id, :winners, :numbers
    def initialize(input)
      input.slice! /Card\s*/
      @card_id = input.slice!(/\d+/).to_i
      input.slice! ": "
      winners, numbers = input.split "|"
      @winners = winners.split(" ").map(&:to_i)
      @numbers = numbers.split(" ").map(&:to_i)
    end
    def winning_count()
      @winners.intersection(@numbers).count
    end
    def score()
      case winning_count
      when 0
        0
      when 1
        1
      else
        2**(winning_count()-1)
      end
    end
  end
end