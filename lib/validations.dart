
bool isPasswordValid(String password) {
  // Define a regular expression for the password format
  RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{12,}$',
  );

  // Use the RegExp test method to check if the password matches the pattern
  return passwordRegex.hasMatch(password);
}

bool isEmailValid(String email) {
  // Define a regular expression for the email format
  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  // Use the RegExp test method to check if the email matches the pattern
  return emailRegex.hasMatch(email);
}