# Mag::Motion

MagMotion is a colletion of monkey patches and wrappers around Cocoa Touch classes that gives them a more ruby-ish interface.

I'm toying around with this library in order to give myself a place to dump a bunch of functionality that finds its way into all the apps I've made since December 2010.

I fully expect 0 other people to use this library, so choices I make will be very opinionated.

The name MagMotion is just a combination of my last name (Maguire) and motion. It sounded cool enough.

## Monkey Patches

### CGRect

Provide `#top`, `#bottom`, `#left`, and `#right`.

### UIColor

Provide `#fromRGB(red, green, blue, alpha=1.0)` that accept integer values and return the corresponding UIColor. The default iOS implementation requires a fraction of a 255 value. This method handles the conversion for you.

```ruby
UIColor.fromRGB(33, 33, 33)
```

### UIView

Provide `#top`, `#bottom`, `#left`, and `#right`.