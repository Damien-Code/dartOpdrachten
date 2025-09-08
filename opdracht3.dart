import 'dart:convert';

final data = {"name": "John Smith", "email": "john@example.com"};
final jsonString = jsonEncode(data);

void main() {
  validateExercise1();
  validateExercise2();
  validateExercise3();
}

Map<String, dynamic> exercise1() {
  // Serialize 'jsonString' to a Map.
  return jsonDecode(jsonString);
}

User exercise2() {
  // Make the class 'User' outside this method.
  // Make sure that the class can initialize a new User object with the Map from exercise 1.

  Map<String, dynamic> user = exercise1();
  return User(user['name'], user['email']);
}

String exercise3() {
  // Update the class 'User' so that it can also encode to a JSON String.
  User user = exercise2();
  return user.toJSON();
}

// The 'User' class definition.
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  String toJSON(){
    return jsonEncode({'name': name, 'email': email});
  }
}

// Validation methods for exercises. DON'T EDIT THESE!

void validateExercise1() {
  print("Validating Exercise 1...");
  final result = exercise1();

  if (result['name'] == data['name'] && result['email'] == data['email']) {
    print("Exercise 1 passed!\n");
  } else {
    print("Exercise 1 failed. Check your implementation.\n");
  }
}

void validateExercise2() {
  print("Validating Exercise 2...");
  final user = exercise2();

  if (user.name == data['name'] && user.email == data['email']) {
    print("Exercise 2 passed!\n");
  } else {
    print("Exercise 2 failed. Check your implementation.\n");
  }
}

void validateExercise3() {
  print("Validating Exercise 3...");

  try {
    final jsonString = exercise3();
    final expectedJson = '{"name":"John Smith","email":"john@example.com"}';

    if (jsonString == expectedJson) {
      print("Exercise 3 passed!\n");
    } else {
      print("Exercise 3 failed. Check your implementation.\n");
    }
  } catch (e) {
    print("Exercise 3 failed. Check your implementation.\n");
  }
}