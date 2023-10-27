import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireAuth {
  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("firbase message : ${e.code.replaceAll('-', " ")}");
    } catch (e) {
      print("errror -> $e");
    }
  }
}
