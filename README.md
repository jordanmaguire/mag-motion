# MagMotion

MagMotion is a colletion of monkey patches and wrappers around Cocoa Touch classes that gives them a more ruby-ish interface.

I'm toying around with this library in order to give myself a place to dump a bunch of functionality that finds its way into all the apps I've made since December 2010.

I fully expect 0 other people to use this library, so choices I make will be very opinionated.

The name MagMotion is just a combination of my last name (Maguire) and motion. It sounded cool enough.

## Monkey Patches

### CGRect

- Provide `#top`, `#bottom`, `#left`, and `#right`.

- Provide a coloured `#to_s`.

### UIColor

- Provide `#fromRGB(red, green, blue, alpha=1.0)` that accepts integer values and returns the corresponding UIColor. The default iOS implementation requires a fraction of a 255 value. `#fromRGB` handles the conversion for you.

```ruby
UIColor.fromRGB(33, 33, 33)

# is equivalent to

UIColor.colorWithRed( 33 / 255.0,
               green: 33 / 255.0,
                blue: 33 / 255.0,
               alpha: 1 )
```

### UIView

- Provide `#addSubviews` for adding multiple subviews.

```ruby
view.addSubviews(one, two, three)
```

- Provide `#top`, `#bottom`, `#left`, and `#right`.

- Provide `#setTopBorderColor(color)` and `#setBottomBorderColor(color)` that will place a 1 point high border on whichever side with the given color.

- Provide `#updateFrame(options)` for updating specific attributes on a UIView's frame.

```ruby
view.updateFrame(x: 100, y: 100, width: 100, height: 100)
view.updateFrame(x: 50, adjustWidth: true) # Changes origin.x to 50 and size.width to 150
```

- Provide a coloured `#to_s`.

## Modules

### KeyboardHandler

The KeyboardHandler can be included into any subclass on UIView.

You should implement two methods in the class that this module is mixed in to:

- `keyboardWillOpen(userInfo)`
- `keyboardWillClose(userInfo)`

Do whatever you need to with these events.

The view will begin listening for `UIKeyboardWillShowNotification` and `UIKeyboardWillHideNotification` on `initWithFrame` and stop listening on `dealloc`.

### ViewNotificationHandler

The ViewNotificationHandler can be included into any subclass on UIView.

ViewNotificationHandler gives your views an easy ruby-like interface for adding observers. It also handles the lifecycle of notifications for you, by removing the observer when the object is dealloc'd.

Add a notification listener like so:

```ruby
def initWithFrame(frame)
  super

  obserNotification(:myNotification) do |notification|
    # Do something here.
  end

  self
end
```

## UIViews

### ConfirmationAlert

A wrapper around BubbleWrap's App.alert that provides an interface I prefer for showing Confirmation Alerts.

Here's a sample of using the interface:

```ruby
alertView = ConfirmationAlert.new
alertView.title = "Title"
alertView.message = "Message"
alertView.cancelButtonTitle = "Cancel"
alertView.confirmButtonTitle = "OK"
alertView.onCancel { puts "Cancel button was touched" }
alertView.onConfirmed { puts "OK button was touched" }
alertView.show
```

TODO: Use UIAlertView by default.
