require_relative "card.rb"
class Board
  def initialize(size)
    @size = size
    @grid = Array.new(size) { [] }
  end

  attr_accessor :grid

  def render
    indices = (0...@size).to_a
    indices.unshift(" ")
    top_row = indices.join(' ')
    puts top_row
    @grid.each_with_index do |row, idx|
      layout = row.map do |card|
        if card.face_up == true 
          card.to_s
        else
          " "
        end
      end
      layout.unshift(idx)
      puts layout.join(' ')
    end
    true
  end

  def populate
    cards = get_card_pairs
    used_cards = []
    @grid.each do |row|
      until row.length == @size
        random_card = cards.sample
        unless used_cards.include?(random_card)
          row << random_card
          used_cards << random_card
        end
      end
    end 
    true
  end

  def get_card_pairs
    faces = []
    unique_card_faces = @size * @size
    until faces.length == unique_card_faces
      random_face = get_random_card_face
      unless faces.include?(random_face)
        2.times { faces << random_face } 
      end
    end
    faces.map { |face| create_card(face) } 
  end

  def get_random_card_face
    (:A..:Z).to_a.sample
  end

  def create_card(card_face)
    Card.new(card_face)
  end

  def won?
    @grid.all? do |row|
        row.all? { |card| card.face_up == true }
    end
  end

end