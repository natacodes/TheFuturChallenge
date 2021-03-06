# TheFuturChallenge
10 day of learning iOS Core Animation

## Day 1
* Animation with duration
* Changing object's position
* Hiding and displaying objects  
[Example](https://twitter.com/natacodes/status/910983629987180544)

### Notes:
**Core Animation** is an infrastructure for compositing and manipulating app’s content in hardware. Core Animation sits beneath AppKit and UIKit and is integrated tightly into the view workflows of Cocoa and Cocoa Touch. Core Animation plays as part of app’s infrastructure.

**Layer objects** are 2D surfaces organized in a 3D space and are at the heart of everything you do with Core Animation.
Like views, layers manage information about the geometry, content, and visual attributes of their surfaces. Unlike views, layers do not define their own appearance. A layer captures your content into a bitmap that can be manipulated easily by the graphics hardware. The main layers you use in your app are considered to be model objects because they primarily manage data.
When you change a property of the layer, all you are doing is changing the state information associated with the layer object.

Core Animation uses **action objects** to implement the default set of animations normally associated with layers.

**Anchor point** defines the point around which manipulations occur.

**Layers Use Two Types of Coordinate Systems** to specify the placement of content.

**Point-based coordinate systems** are used when specifying values that map directly to screen coordinates or must be specified relative to another layer, such as for the layer’s *position* property.  
**Properties:** bounds, position, frame 

**Unit coordinate systems** are used when the value should not be tied to screen coordinates because it is relative to some other value. For example, the layer’s anchorPoint property specifies a point relative to the bounds of the layer itself, which can change. You can think of the unit coordinates as specifying a percentage of the total possible value. Every coordinate in the unit coordinate space has a range of 0.0 to 1.0. 
**Properties:** *anchor point* is one of several properties that you specify using the unit coordinate system.

## Day 2
* Animating objects  using Auto Layout constraints  
[Example](https://twitter.com/natacodes/status/911433118686470144)

### Notes:
[**Layers Can Be Manipulated in Three Dimensions**](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html#//apple_ref/doc/uid/TP40004514-CH2-SW18)  
The *transform* property of CALayer specifies the transforms that you want to apply both to the layer and its embedded sublayers. The *sublayerTransform* property defines additional transformations that apply only to the sublayers.

In Core Animation, the transform in the figure is represented by the *CATransform3D* type.

[**Layer Trees Reflect Different Aspects of the Animation State**](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html#//apple_ref/doc/uid/TP40004514-CH2-SW19)  
An app using Core Animation has three sets of layer objects. Each set of layer objects has a different role in making the content of your app appear onscreen:
* Objects in the *model layer tree* are the model objects that store the target values for any animations. Whenever you change the property of a layer, you use one of these objects.
* Objects in the *presentation tree* contain the in-flight values for any running animations. The objects in the presentation tree reflect the current values as they appear onscreen.
* Objects in the *render tree* perform the actual animations and are private to Core Animation.

## Day 3
* Using CABasicAnimation
* Animations using managing layers  
[Example](https://twitter.com/natacodes/status/911795004909150208)

### Notes:
[**Enabling Core Animation Support in Your App**](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW5)  
In iOS apps, Core Animation is always enabled and every view is backed by a layer. In OS X, apps must explicitly enable Core Animation support by doing the following:   
* Link against the QuartzCore framework. (iOS apps must link against this framework only if they use Core Animation interfaces explicitly.)
* Enable layer support for one or more of your NSView objects by doing one of the following:
  * In your nib files, use the View Effects inspector to enable layer support for your views. The inspector displays checkboxes for the selected view and its subviews. It is recommended that you enable layer support in the content view of your window whenever possible.
  * For views you create programmatically, call the view’s setWantsLayer: method and pass a value of YES to indicate that the view should use layers.
  
Most iOS views create a CALayer object and use that layer as the backing store for its content. For most of your own views, this default choice is a good one and you should not need to change it. But you might find that a different layer class is more appropriate in certain situations. For example, you might want to change the layer class in the following situations:
* Your view draws content using Metal or OpenGL ES, in which case you would use a CAMetalLayer or CAEAGLLayer object.
* There is a specialized layer class that offers better performance.
* You want to take advantage of some specialized Core Animation layer classes, such as particle emitters or replicators.

[CALayer subclasses and their uses](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW25)

**Layers Have Their Own Background and Border**  
A layer can display a filled background and a stroked border in addition to its image-based contents. The background color is rendered behind the layer’s contents image and the border is rendered on top of that image.  If the layer contains sublayers, they also appear underneath the border. Because the background color sits behind your image, that color shines through any transparent portions of your image.

```swift
myLayer.backgroundColor = [NSColor greenColor].CGColor;
myLayer.borderColor = [NSColor blackColor].CGColor;
myLayer.borderWidth = 3.0;
```
**Layers Support a Corner Radius**   
[cornerRadius](https://developer.apple.com/documentation/quartzcore/calayer/1410818-cornerradius)

## Day 4
* Using CAKeyframeAnimation  
[Example](https://twitter.com/natacodes/status/912947865516859392)   

**Animating a change implicitly:**
```swift
theLayer.opacity = 0.0
```
**Animating a change explicitly:**
```swift
let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
colorKeyframeAnimation.values = [UIColor.black.cgColor, UIColor.blue.cgColor]
colorKeyframeAnimation.keyTimes = [0, 1]
colorKeyframeAnimation.duration = 1
colorKeyframeAnimation.autoreverses = false
self.plusButton.backgroundColor = UIColor.blue

// Set animations
self.plusButton.layer.add(rotateAnimation, forKey: nil)
self.plusButton.layer.add(colorKeyframeAnimation, forKey: "color")

// Change the actual data value in the layer to the final value.
self.plusButton.backgroundColor = UIColor.blue
```

Unlike an implicit animation, which updates the layer object’s data value, an explicit animation does not modify the data in the layer tree. Explicit animations only produce the animations. At the end of the animation, Core Animation removes the animation object from the layer and redraws the layer using its current data values. If you want the changes from an explicit animation to be permanent, you must also update the layer’s property as shown in the preceding example.

## Day 5
* More practice with rotations  
[Example](https://twitter.com/natacodes/status/913292684428587008)   

[**Using a Keyframe Animation to Change Layer Properties**](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/CreatingBasicAnimations/CreatingBasicAnimations.html#//apple_ref/doc/uid/TP40004514-CH3-SW8)
A key frame animation consists of a set of target data values and the times at which each value should be reached. In the simplest configuration, you specify both the values and times using an array. For changes to a layer’s position, you can also have the changes follow a path. The animation object takes the key frames you specify and builds the animation by interpolating from one value to the next over the given time periods.

## Day 6  
* Animation for a list of items  
[Example](https://twitter.com/natacodes/status/913648060302888960)

## Day 7  
* Animated switcher  
[Example](https://twitter.com/natacodes/status/914033298912899073)

## Day 8  
* Adding new items in a list  
[Example](https://twitter.com/natacodes/status/914312099047731200)

## Day 9  
* Animation for switcher  
[Example](https://twitter.com/natacodes/status/916491673680490497)

## Day 10  
* Delete item  
[Example](https://twitter.com/natacodes/status/918634908309905408)

 

