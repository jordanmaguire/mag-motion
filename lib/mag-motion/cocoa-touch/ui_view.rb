class UIView

  def addSubviews(*subviews)
    subviews.each { |subview| addSubview(subview) }
  end

  def bottom
    frame.bottom
  end

  def left
    frame.left
  end

  def right
    frame.right
  end

  def top
    frame.top
  end

# Updating frame

  # Terse syntax for updating the origin and size of a UIView
  #
  # options is a hash with the same keys as updateOrigin and updateSize
  def updateFrame(options)
    updateOrigin(options)
    updateSize(options)
    frame
  end

private

  # Terse syntax for updating just the origin of a UIView
  #
  # options is a hash with the following available keys:
  #   * adjustWidth: A boolean indicating whether or not the width should adjust to cover
  #                  the same space it did before the change. Ignored if false or if x is nil
  #   * x: A value to change the x origin to
  #   * y: A value to change the y origin to
  def updateOrigin(options)
    return frame if options.nil? || (options[:x].nil? && options[:y].nil?)
    self.frame = frame.tap do |f|
      # If we pass the adjustWidth option through, we must ensure that the total width of the
      # view remains the same.
      # So if the origin.x was 50, and the size.width was 300, and we change the origin.x to
      # 25, then the width must increase to 325 to cover the same space.
      if options[:x] && options[:adjustWidth] && options[:width].nil?
        f.size.width = f.size.width + f.origin.x - options[:x]
      end

      f.origin.x = options[:x] unless options[:x].nil?
      f.origin.y = options[:y] unless options[:y].nil?
    end
  end

  # Terse syntax for updating just the size of a UIView
  #
  # options is a hash with the following available keys:
  #   * width: A value to change the width to
  #   * height: A value to change the height to
  def updateSize(options)
    return frame if options.nil? || (options[:width].nil? && options[:height].nil?)
    self.frame = frame.tap do |f|
      f.size.width = options[:width] unless options[:width].nil?
      f.size.height = options[:height] unless options[:height].nil?
    end
  end

end