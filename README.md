
Not all the requirements have been completed🙇.

### Answer for Question 1

A simple struct can represent a Widget, including properties like `color`, `position`, and `size`. 

However, to represent the entire set of Widgets, a [QuadTree might](https://en.wikipedia.org/wiki/Quadtree) might be appropriate. As more widgets are dragged in, the rectangles would need further subdivision. (Haven't had time to thoroughly research this yet)


### Answer for Questions 2, 3, 4

Attempted to implement this through the [Calculator](https://github.com/GenerativeHuman/Widgets/blob/main/Widgets/UseCases/Calculator.swift) using [insertChild](https://github.com/GenerativeHuman/Widgets/blob/main/Widgets/Entities/QuadTreeNode.swift#L45), but it’s not yet completed. 

The [insertNewWidget](https://github.com/GenerativeHuman/Widgets/blob/main/Widgets/UseCases/Calculator.swift#L13C63-L13C75) method takes a `QuadTreeNode` as input and returns a `QuadTreeNode` to minimize side effects. But there are still many places where it could be optimized further.

The [unit tests](https://github.com/GenerativeHuman/Widgets/blob/main/WidgetsTests/CalculatorTests.swift) currently only cover a few cases that validate size because I haven't yet found the perfect calculation method.
