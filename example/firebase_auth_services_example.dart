import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_services/firebase_auth_services.dart';

void main() async {
  
  await Firebase.initializeApp();

  
  AuthService authService = AuthService();

  
  String email = 'test@example.com';
  String password = 'password123';
  User? user = await authService.registerWithEmailAndPassword(email, password);
  if (user != null) {
    print('Registration successful: ${user.email}');
  } else {
    print('Registration failed');
  }

  
  user = await authService.loginWithEmailAndPassword(email, password);
  if (user != null) {
    print('Login successful: ${user.email}');
  } else {
    print('Login failed');
  }

  
  bool isLoggedIn = await authService.isLoggedIn();
  print('User is logged in: $isLoggedIn');

  
  bool emailUpdated = await authService.updateEmail('newemail@example.com');
  if (emailUpdated) {
    print('Email update successful');
  } else {
    print('Email update failed');
  }

  
  await authService.logout();
  print('User logged out');

  
  isLoggedIn = await authService.isLoggedIn();
  print('User is logged in: $isLoggedIn');
}
