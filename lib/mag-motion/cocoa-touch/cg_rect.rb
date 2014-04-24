class CGRect

  include ConsoleColors

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

  def to_s
    [
      "#{pinkColor}x:#{textReset} #{origin.x}, ",
      "#{pinkColor}y:#{textReset} #{origin.y}, ",
      "#{pinkColor}width:#{textReset} #{size.width}, ",
      "#{pinkColor}height:#{textReset} #{size.height}",
    ].join("")
  end

end
