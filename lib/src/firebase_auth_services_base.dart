import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveToken(userCredential.user);
      return userCredential.user;
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveToken(userCredential.user);
      return userCredential.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _removeToken();
  }

  Future<bool> updateEmail(String newEmail) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await user.updateEmail(newEmail);
        return true;
      } catch (e) {
        print("Email Update Error: $e");
        return false;
      }
    }
    return false;
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> _saveToken(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', user?.uid ?? '');
  }

  Future<void> _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userToken');
  }
}
