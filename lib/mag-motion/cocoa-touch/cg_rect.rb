class CGRect

  def bottom
    origin.y + size.height
  end

  def left
    origin.x
  end

  def right
    origin.x + size.width
  end

  def top
    origin.y
  end

end
