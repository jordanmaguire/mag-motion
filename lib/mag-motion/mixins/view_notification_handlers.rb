module ViewNotificationHandler

  def observeNotification(notification, &onReceiveNotification)
    observedNotifications << App.notification_center.observe(notification, &onReceiveNotification)
  end

# NSObject

  def dealloc
    observedNotifications.each { |observer| App.notification_center.unobserve(observer) }
    super
  end

private

  def observedNotifications
    @observedNotifications ||= []
  end

end