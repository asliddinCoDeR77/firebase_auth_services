## AuthService Package
A simple and efficient authentication service for Flutter applications using Firebase Authentication and Shared Preferences. This package provides functionalities for user registration, login, email update, and logout, while managing the user token locally.

## Features
- Register with Email and Password
- Login with Email and Password
- Logout and clear user token
- Update user email
- Check if user is logged in
- Retrieve current user

## Installation
Add the following to your `pubspec.yaml` file:

```dart
dependencies:
  firebase_auth: ^4.1.0
  shared_preferences: ^2.0.15
```  

Then, run ``flutter pub get`` to install the dependencies.

## Usage
Import the package in your Dart file:

```dart
import 'auth_service.dart';
```
### Register a New User
```dart
AuthService authService = AuthService();

Future<void> registerUser() async {
  User? user = await authService.registerWithEmailAndPassword(
    'user@example.com',
    'password123',
  );
  if (user != null) {
    print('Registration successful!');
  } else {
    print('Registration failed.');
  }
}
```

### Login a User
```dart
Future<void> loginUser() async {
  User? user = await authService.loginWithEmailAndPassword(
    'user@example.com',
    'password123',
  );
  if (user != null) {
    print('Login successful!');
  } else {
    print('Login failed.');
  }
}
```
### Logout a User
```dart
Future<void> logoutUser() async {
  await authService.logout();
  print('User logged out.');
}
``` 
### Update User Email
```dart
Future<void> updateUserEmail() async {
  bool success = await authService.updateEmail('newemail@example.com');
  if (success) {
    print('Email updated successfully!');
  } else {
    print('Email update failed.');
  }
}
```
### Check if User is Logged In
```dart
Future<void> checkUserLoggedIn() async {
  bool loggedIn = await authService.isLoggedIn();
  if (loggedIn) {
    print('User is logged in.');
  } else {
    print('User is not logged in.');
  }
}
```
### Get Current User
``` dart
User? user = authService.getCurrentUser();
if (user != null) {
  print('Current user: ${user.email}');
} else {
  print('No user is currently logged in.');
}
```

### Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

### License
This project is licensed under the MIT License - see the LICENSE file for details.