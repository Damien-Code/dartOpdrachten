void main() {
  validateExercise1(); // List & Loop
  validateExercise2(); // Map & Flow Control
  validateExercise3(); // Function
  validateExercise4(); // Exception
  validateExercise5(); // Async & Await
}

// Exercise 1: List & Loop
int sumOfEvenNumbers(List<int> numbers) {
  int total = 0;
  // Return the sum of all even numbers in the list.
  for(int num in numbers){  
    if(num % 2 == 0)
    {
      total += num;
    }
  }
  return total;
}
  


// Exercise 2: Map & Flow Control
String getUserInfo(Map<String, dynamic> user) {
  // The Map 'user' has a 'name', 'age', and 'email'.
  // Return a string that says "Name: <name>, Age: <age>, Email: <email>".
  // If the 'age' is not provided in the Map, the function should return "Age: Unknown".

  return 'Name: ${user['name']}, Age: ${user['age'] ?? 'Unknown'}, Email: ${user['email']}';
}

// Exercise 3: Function
double applyDiscount(double price, double Function(double) discount) {
  // Update the function 'dicount' below.
  // Call the function with the 'price' as a parameter, and return the result.

  return discount(price);
}

double discount(double price) {
  // Apply a 10% discount on the 'price', and return the new value.
  double discountedPrice = price * 0.9;
  return discountedPrice;
}

// Exercise 4: Exception
int divide(int a, int b) {
  if(b == 0)
  {
    throw Exception('Division by zero');
  }
  // Divide 'b' from 'a' and return the result.
  // If the divisor is zero, throw an exception with the message "Division by zero".
 int result = a ~/ b;
  return result;
}

// Exercise 5: Async & Await
Future fetchData() async {
  // Simulate fetching data from a server with a 1-second delay.
  // Return the (empty) result.

  return Future.delayed(const Duration(seconds: 1));
}

// Validation methods for exercises. DON'T EDIT THESE!

// Validation for Exercise 1
void validateExercise1() {
  print("Validating Exercise 1...");
  final result = sumOfEvenNumbers([1, 2, 3, 4, 5, 6]);
  if (result == 12) {
    print("Exercise 1 passed!\n");
  } else {
    print("Exercise 1 failed. Expected 12 but got $result.\n");
  }
}

// Validation for Exercise 2
void validateExercise2() {
  print("Validating Exercise 2...");
  final userInfo1 =
      getUserInfo({"name": "John", "age": 30, "email": "john@example.com"});
  final userInfo2 = getUserInfo({"name": "Jane", "email": "jane@example.com"});

  if (userInfo1 == "Name: John, Age: 30, Email: john@example.com" &&
      userInfo2 == "Name: Jane, Age: Unknown, Email: jane@example.com") {
    print("Exercise 2 passed!\n");
  } else {
    print("Exercise 2 failed.\n");
  }
}

// Validation for Exercise 3
void validateExercise3() {
  print("Validating Exercise 3...");
  final result = applyDiscount(100.0, discount);

  if (result == 90.0) {
    print("Exercise 3 passed!\n");
  } else {
    print("Exercise 3 failed. Expected 90.0 but got $result.\n");
  }
}

// Validation for Exercise 4
void validateExercise4() {
  print("Validating Exercise 4...");
  try {
    divide(10, 2);
    divide(10, 0);
    print("Exercise 4 failed. Expected exception but got result.\n");
  } catch (e) {
    if (e.toString() == "Exception: Division by zero") {
      print("Exercise 4 passed!\n");
    } else {
      print("Exercise 4 failed. Wrong exception message.\n");
    }
  }
}

// Validation for Exercise 5
void validateExercise5() async {
  print("Validating Exercise 5...");
  final result = await fetchData();

  if (result == null) {
    print("Exercise 5 passed!\n");
  } else {
    print(
        "Exercise 5 failed. Expected 'The response of the correct function' but got '$result'.\n");
  }
}