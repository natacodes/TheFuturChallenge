# TheFuturChallenge
30 day of learning iOS Core Animation

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

## Day 4
* Using CAKeyframeAnimation  
[Example](https://twitter.com/natacodes/status/912947865516859392)

## Day 5
* More practice with rotations  
[Example](https://twitter.com/natacodes/status/913292684428587008)

## Day 6  
* Animation for a list of items  
[Example](https://twitter.com/natacodes/status/913648060302888960)

## Day 7  
* Animated switcher  
[Example](https://twitter.com/natacodes/status/914033298912899073)
 

