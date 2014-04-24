class UIColor

  def self.fromRGB(red, green, blue, alpha=1.0)
    colorWithRed( red / 255.0,
           green: green / 255.0,
            blue: blue / 255.0,
           alpha: alpha )
  end

end