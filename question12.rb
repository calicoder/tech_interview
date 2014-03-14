#design a deck of cards

class Card
  attr_accessor :letter #A,2,3,4,5,6,7,8,9,10,J,Q,K
  attr_accessor :suit #clubs, hearts, spades, diamonds

  def intialize(letter, suit)
    self.letter = letter
    self.suit = suit
  end
end

class BlackJackCard < Card
  def value
    if letter == "A"
      11
    elsif ["J", "Q", "K"].include?(letter)
      10
    else
      letter.to_i
    end
  end

  def ace?
    self.card.letter == "A"
  end
end

class BlackJackHand
  attr_accesor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def total
    total = 0
    number_of_aces = 0

    self.cards.each do |card|
      if card.ace?()
        number_of_aces +=1
      else
        total += card.value
      end
    end

    number_of_aces.times do
      if total > 11
        total += 1
      else
        total += 11
      end
    end

    total
  end
end

class BlackJackHands
  attr_accessor :hands
end