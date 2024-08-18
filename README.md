
Not all the requirements have been completed🙇.

> 1. What kind of data structure is needed to represent the layout of
a widget?

A simple struct can represent a Widget, including properties like `color`, `position`, and `size`. 

However, to represent the entire set of Widgets, a [QuadTree might](https://en.wikipedia.org/wiki/Quadtree) might be appropriate. As more widgets are dragged in, the rectangles would need further subdivision. Haven't had time to thoroughly research this yet


> 2. Implement a process to calculate the frame of each widget based
on the data you answered in question 1.

> 3. Implement a function that calculates how the data you answered
in question 1 changes when a widget is dropped at a given
coordinate. It should be implemented as a function with no side
effects, and you should write a unit test.

Attempted to implement this through the [Calculator](https://github.com/GenerativeHuman/Widgets/blob/main/Widgets/UseCases/Calculator.swift) using `insertChild`, but it’s not yet completed. Unit tests:https://github.com/GenerativeHuman/Widgets/blob/main/WidgetsTests/CalculatorTests.swift ) 
