import 'dart:async';

void main() {
  validateExercise1(); // Classes & Inheritance
  validateExercise2(); // Mixins
  validateExercise3(); // Abstract Classes & Polymorphism
}

// Exercise 1: Classes & Inheritance

// Complete in 'Animal' the method 'speak()' so that it prints "<name> makes a noise".
class Animal {
  String name;

  Animal(this.name);

  void speak() {}
}

// Override in subclass 'Dog' the method 'speak()' so that it prints "<name> barks".
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {}
}

// Exercise 2: Mixins

// Complete in mixin 'Flyable' the method 'fly()' so that it prints "Flying".
mixin Flyable {
  void fly() {}
}

class Bird extends Animal with Flyable {
  Bird(String name) : super(name);
}

abstract class Shape {
  double area();
}

// Complete in 'Circle' the method 'area()' so that it returns the area of a circle.
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 0;
  }
}

// Complete in 'Rectangle' the method 'area()' so that it returns the area of a rectangle.
class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return 0;
  }
}

// VALIDATION FUNCTIONS (DO NOT EDIT THESE)

// Helper function to capture print output
String capturePrint(Function func) {
  final spec = ZoneSpecification(print: (self, parent, zone, line) {
    parent.print(zone, line);
    _printBuffer.writeln(line);
  });
  return Zone.current.fork(specification: spec).run(() {
    _printBuffer = StringBuffer();
    func();
    return _printBuffer.toString().trim();
  });
}

StringBuffer _printBuffer = StringBuffer();

// Validation for Exercise 1
void validateExercise1() {
  print("Validating Exercise 1...");
  final dog = Dog("Rex");
  final output = capturePrint(() => dog.speak());

  if (output == "Rex barks") {
    print("Exercise 1 passed!\n");
  } else {
    print("Exercise 1 failed. Expected 'Rex barks', but got '$output'.\n");
  }
}

// Validation for Exercise 2
void validateExercise2() {
  print("Validating Exercise 2...");
  final bird = Bird("Tweety");
  final output = capturePrint(() => bird.fly());

  if (output == "Flying") {
    print("Exercise 2 passed!\n");
  } else {
    print("Exercise 2 failed. Expected 'Flying', but got '$output'.\n");
  }
}

// Validation for Exercise 3
void validateExercise3() {
  print("Validating Exercise 3...");
  final circle = Circle(10);
  final rectangle = Rectangle(5, 10);

  double roundToTwoDecimalPlaces(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  final circleArea = roundToTwoDecimalPlaces(circle.area());
  final rectangleArea = roundToTwoDecimalPlaces(rectangle.area());

  if (circleArea == 314.16 && rectangleArea == 50.0) {
    print("Exercise 3 passed!\n");
  } else {
    print("Exercise 3 failed.\n");
  }
}