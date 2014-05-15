module KeyboardHandler

# UIView

  def initWithFrame(frame)
    super

    whenKeyboardOpens {|notification| keyboardWillOpen(notification.userInfo) }
    whenKeyboardCloses {|notification| keyboardWillClose(notification.userInfo) }

    self
  end

# NSObject

  def dealloc
    App.notification_center.unobserve(keyboardCloseObserver) if keyboardCloseObserver
    App.notification_center.unobserve(keyboardOpenObserver) if keyboardOpenObserver
  end

protected

  attr_accessor :keyboardCloseObserver, :keyboardOpenObserver

  def keyboardWillOpen(userInfo)
    # Override in subclass
  end

  def keyboardWillClose(userInfo)
    # Override in subclass
  end

  def whenKeyboardCloses(&onKeyboardClose)
    self.keyboardCloseObserver = App.notification_center.observe(UIKeyboardWillHideNotification, &onKeyboardClose)
  end

  def whenKeyboardOpens(&onKeyboardOpen)
    self.keyboardOpenObserver = App.notification_center.observe(UIKeyboardWillShowNotification, &onKeyboardOpen)
  end

end