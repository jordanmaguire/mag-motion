# Use a ConfirmationAlert to display a yes/no ("OK" and "Cancel", respectively)
# prompt to the user.
#
# Usage:
#
#  alertView = ConfirmationAlert.new
#  alertView.title = "Title"
#  alertView.message = "Message"
#  alertView.cancelButtonTitle = "Cancel"
#  alertView.confirmButtonTitle = "OK"
#  alertView.onCancel { puts "Cancel button was touched" }
#  alertView.onConfirmed { puts "OK button was touched" }
#  alertView.show
#
class ConfirmationAlert

  attr_accessor :cancelButtonTitle, :confirmButtonTitle, :message, :title

  def close
    alertView.dismissWithClickedButtonIndex(0, animated: true)
  end

  def onCancel(&onCancel)
    @onCancel = onCancel
  end

  # Public: Allows a block to be passed that will be called when the UIAlertView's
  # 'OK' button is touched.
  #
  # onConfirmed - A block with no arguments
  def onConfirmed(&onConfirmed)
    @onConfirmed = onConfirmed
  end

  # Public: Create and show a UIAlertView in the application.
  def show
    self.alertView = App.alert( title,
                       message: message,
           cancel_button_title: [cancelButtonTitle, confirmButtonTitle],
                      on_click: method(:alertButtonWasTouched) )
    self
  end

# NSObject

  def initialize
    self.confirmButtonTitle = "OK"
    self.cancelButtonTitle = "Cancel"
  end

private

  attr_accessor :alertView

  def alertButtonWasTouched(alert)
    if alert.clicked_button.cancel?
      @onCancel.call unless @onCancel.nil?
    else
      @onConfirmed.call unless @onConfirmed.nil?
    end
  end

end