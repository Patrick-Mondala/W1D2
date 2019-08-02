class Card

  attr_reader :face, :face_up

  def initialize(face)
    @face = face
    @face_up = false
  end

  def hide 
    @face_up = false
  end

  def reveal 
    @face_up = true
  end

  def to_s
    @face.to_s
  end

end