# PulsarFlowerActivityIndicator
A pulsing activity indicator written in swift 3


![alt text][preview]

##Installation
###Cocoapods
is comming soon

###Manually
Just drag RNLoadingButton.swift to your project and you are good to go.

##Usage

Simply instantiate PulsarFlowerActivityIndicator with the desired frame and add to your view hierarchy.
```swift
let pulsar = PulsarFlowerActivityIndicator(frame:  CGRect(x: 0, y: 0, width: 50, height: 50))
self.view.addSubview(pulsar)
```

to change color:
```swift
pulsar.mainColor = UIColor.blue
```

or define color for each of 4 elipses in PulsarFlowerActivityIndicator
```swift
let color1 = UIColor(displayP3Red: 239.0/255.0, green: 72.0/255.0, blue: 54.0/255.0, alpha: 1)
let color2 = UIColor(displayP3Red: 102.0/255.0, green: 51.0/255.0, blue: 153.0/255.0, alpha: 1)
let color3 = UIColor(displayP3Red: 65.0/255.0, green: 131.0/255.0, blue: 215.0/255.0, alpha: 1)
let color4 = UIColor(displayP3Red: 3.0/255.0, green: 201.0/255.0, blue: 169.0/255.0, alpha: 1)
pulsar.elipseColors = [color1, color2, color3, color4]
```

to change stroke line width( default = 2):
```swift
pulsar.lineWidth = 4
```

to change animation duration for one full wheel turn:
```swift
pulsar.duration = 4
```

To start animation :
```swift
pulsar.startAnimation()
```

To stop (with optional completion handler):
```swift
pulsar.stopAnimation { 
            print("animation stopped")
        }
```

##License
PulsarFlowerActivityIndicator is released under the MIT license. See [LICENSE](https://opensource.org/licenses/MIT) for details.

[preview]: https://github.com/Belinskaya/PulsarFlowerActivityIndicator/blob/master/pulsar.gif
